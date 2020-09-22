#
#	----------------------------------------------------------
#	Mosaic | OF Visual Patching Developer Platform
#
#	Copyright (c) 2020 Emanuele Mazza aka n3m3da
#
#	Mosaic is distributed under the MIT License. This gives everyone the
#   freedoms to use Mosaic in any context: commercial or non-commercial,
#   public or private, open or closed source.
#
#   See https://github.com/d3cod3/Mosaic for documentation
#	----------------------------------------------------------
#
#
#	DataFromToMosaic.py: Send and receive numerical data from Mosaic --> to python --> back to Mosaic
#

import random

class mosaicApp(object):
	def __init__(self):
		# setup

		# _mosaic_data_outlet list is inited with size 1 [0]
		# with append() we increment the size to 2
		# so we have now [0] and [1] available
		_mosaic_data_outlet.append(0)

	def update(self):
		# loop

		# bypass data from Mosaic (_mosaic_data_outlet) patch back to Mosaic patch (_mosaic_data_inlet)
		_mosaic_data_outlet[0] = _mosaic_data_inlet[0]

		# standard python random number generator
		_mosaic_data_outlet[1] = random.random()
