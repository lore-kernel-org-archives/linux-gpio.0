From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documenation: driver-api: fix gpio/board.rst warning
Date: Sun, 10 Feb 2019 22:28:24 -0800
Message-ID: <13290065-5568-c0d0-9e7b-7a02ad71dbb0@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix markup warning: insert a blank line before the list.

Documentation/driver-api/gpio/board.rst:209: WARNING: Unexpected indentation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
---
 Documentation/driver-api/gpio/board.rst |    1 +
 1 file changed, 1 insertion(+)

--- lnx-50-rc6.orig/Documentation/driver-api/gpio/board.rst
+++ lnx-50-rc6/Documentation/driver-api/gpio/board.rst
@@ -204,6 +204,7 @@ between a caller and a respective .get/s
 
 In order to qualify for fast bitmap processing, the array must meet the
 following requirements:
+
 - pin hardware number of array member 0 must also be 0,
 - pin hardware numbers of consecutive array members which belong to the same
   chip as member 0 does must also match their array indexes.
