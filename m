From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] gpio: label descriptors using the device name
Date: Mon, 15 Jan 2018 12:55:24 +0300
Message-ID: <20180115095524.yzvynni5rjyi4ms2@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:47310 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932521AbeAOJzi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jan 2018 04:55:38 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org

Hello Linus Walleij,

The patch 24e78079bf22: "gpio: label descriptors using the device
name" from Jan 4, 2018, leads to the following static checker warning:

	drivers/gpio/gpiolib.c:3675 gpiod_get_index()
	error: we previously assumed 'dev' could be null (see line 3649)

drivers/gpio/gpiolib.c
  3638  struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
  3639                                                 const char *con_id,
  3640                                                 unsigned int idx,
  3641                                                 enum gpiod_flags flags)
  3642  {
  3643          struct gpio_desc *desc = NULL;
  3644          int status;
  3645          enum gpio_lookup_flags lookupflags = 0;
  3646  
  3647          dev_dbg(dev, "GPIO lookup for consumer %s\n", con_id);
  3648  
  3649          if (dev) {
                    ^^^
Old code checked 'dev'.

  3650                  /* Using device tree? */
  3651                  if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
  3652                          dev_dbg(dev, "using device tree for GPIO lookup\n");
  3653                          desc = of_find_gpio(dev, con_id, idx, &lookupflags);
  3654                  } else if (ACPI_COMPANION(dev)) {
  3655                          dev_dbg(dev, "using ACPI for GPIO lookup\n");
  3656                          desc = acpi_find_gpio(dev, con_id, idx, &flags, &lookupflags);
  3657                  }
  3658          }
  3659  
  3660          /*
  3661           * Either we are not using DT or ACPI, or their lookup did not return
  3662           * a result. In that case, use platform lookup as a fallback.
  3663           */
  3664          if (!desc || desc == ERR_PTR(-ENOENT)) {
  3665                  dev_dbg(dev, "using lookup tables for GPIO lookup\n");
  3666                  desc = gpiod_find(dev, con_id, idx, &lookupflags);
  3667          }
  3668  
  3669          if (IS_ERR(desc)) {
  3670                  dev_dbg(dev, "lookup for GPIO %s failed\n", con_id);
  3671                  return desc;
  3672          }
  3673  
  3674          /* If a connection label was passed use that, else use the device name as label */
  3675          status = gpiod_request(desc, con_id ? con_id : dev_name(dev));
                                                               ^^^^^^^^^^^^^
Patch adds new unchecked dereference.

  3676          if (status < 0)
  3677                  return ERR_PTR(status);
  3678  
  3679          status = gpiod_configure_flags(desc, con_id, lookupflags, flags);
  3680          if (status < 0) {
  3681                  dev_dbg(dev, "setup of GPIO %s failed\n", con_id);
  3682                  gpiod_put(desc);

regards,
dan carpenter
