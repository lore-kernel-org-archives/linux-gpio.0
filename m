From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 0/8] Move most GPIO documentation to driver-api/gpio/ and ReST
Date: Fri,  9 Mar 2018 00:40:16 +0100
Message-ID: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: linux-gpio@vger.kernel.org

The aim of this patchset is to move the GPIO subsystem's documentation
under Documentation/driver-api/gpio/ such that it is picked up by Sphinx
and compiled into HTML. I moved everything except for sysfs.txt, because
this file describes the legacy sysfs ABI, and doesn't seem to serve much
(non-historical) purpose anymore.

There are still some rough edges:

* I think the API documentation (kernel-doc) should be moved out of
  index.rst into more appropriate files.
* The headings are arguably wrong, because driver.rst, consumer.rst,
  etc. use the "document title" style, even though they are part of the
  GPIO chapter. But the resulting TOC tree is consistent, and I did not
  want to change almost all headings.
* Some of the files could use more :c:func:`...` references and general
  ReST polish.

But I don't want to make this patchset too large.

Jonathan Neuschäfer (8):
  MAINTAINERS: GPIO: Add Documentation/driver-api/gpio/
  Documentation: driver-api: Move gpio.rst to gpio/index.rst
  Documentation: gpio: Move introduction to driver-api
  Documentation: gpio: Move driver documentation to driver-api
  Documentation: gpio: Move legacy documentation to driver-api
  Documentation: gpio: Move gpiod_* consumer documentation to driver-api
  Documentation: gpio: Move GPIO mapping documentation to driver-api
  Documentation: gpio: Move drivers-on-gpio.txt to driver-api

 .../{gpio/board.txt => driver-api/gpio/board.rst}  | 39 +++++-----
 .../consumer.txt => driver-api/gpio/consumer.rst}  | 85 +++++++++++-----------
 .../driver.txt => driver-api/gpio/driver.rst}      | 80 ++++++++++----------
 .../gpio/drivers-on-gpio.rst}                      |  1 +
 .../driver-api/{gpio.rst => gpio/index.rst}        | 21 +++---
 .../{gpio/gpio.txt => driver-api/gpio/intro.rst}   |  9 ++-
 .../gpio-legacy.txt => driver-api/gpio/legacy.rst} | 68 ++++++++++-------
 Documentation/driver-api/index.rst                 |  2 +-
 Documentation/gpio/00-INDEX                        | 13 ----
 Documentation/gpio/sysfs.txt                       |  5 +-
 MAINTAINERS                                        |  1 +
 11 files changed, 169 insertions(+), 155 deletions(-)
 rename Documentation/{gpio/board.txt => driver-api/gpio/board.rst} (88%)
 rename Documentation/{gpio/consumer.txt => driver-api/gpio/consumer.rst} (89%)
 rename Documentation/{gpio/driver.txt => driver-api/gpio/driver.rst} (93%)
 rename Documentation/{gpio/drivers-on-gpio.txt => driver-api/gpio/drivers-on-gpio.rst} (99%)
 rename Documentation/driver-api/{gpio.rst => gpio/index.rst} (74%)
 rename Documentation/{gpio/gpio.txt => driver-api/gpio/intro.rst} (96%)
 rename Documentation/{gpio/gpio-legacy.txt => driver-api/gpio/legacy.rst} (96%)

-- 
2.16.1
