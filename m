From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: gpiolib: translate pin number in GPIO ACPI callbacks
Date: Mon, 23 Mar 2015 18:55:27 +0300
Message-ID: <20150323155527.GC24038@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:36649 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbbCWPzf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2015 11:55:35 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: qipeng.zha@intel.com
Cc: linux-gpio@vger.kernel.org

Hello qipeng.zha,

The patch 4de60970abf9: "gpiolib: translate pin number in GPIO ACPI
callbacks" from Mar 11, 2015, leads to the following static checker
warning:

	drivers/gpio/gpiolib-acpi.c:559 acpi_gpio_adr_space_handler()
	warn: unsigned 'pin' is never less than zero.

drivers/gpio/gpiolib-acpi.c
   550  
   551          length = min(agpio->pin_table_length, (u16)(pin_index + bits));
   552          for (i = pin_index; i < length; ++i) {
   553                  unsigned pin = agpio->pin_table[i];
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^
"pin" is already assigned.

   554                  struct acpi_gpio_connection *conn;
   555                  struct gpio_desc *desc;
   556                  bool found;
   557  
   558                  pin = acpi_gpiochip_pin_to_gpio_offset(chip, pin);
   559                  if (pin < 0) {
                            ^^^^^^^
Error checking doesn't work.

   560                          status = AE_BAD_PARAMETER;
   561                          goto out;
   562                  }
   563  
   564                  mutex_lock(&achip->conn_lock);

regards,
dan carpenter
