From: abdoulaye berthe <berthe.ab@gmail.com>
Subject: [PATCH 0/3] remove all usage of gpio_remove retval
Date: Sat, 12 Jul 2014 22:30:11 +0200
Message-ID: <1405197014-25225-1-git-send-email-berthe.ab@gmail.com>
References: <CACRpkda6mzVdaN0cvOxpbsxWyCv2nGyDXOjZg_5aT8u7SSQeUw@mail.gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:46120 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751789AbaGLUaY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Jul 2014 16:30:24 -0400
In-Reply-To: <CACRpkda6mzVdaN0cvOxpbsxWyCv2nGyDXOjZg_5aT8u7SSQeUw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, m@bues.ch, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: abdoulaye berthe <berthe.ab@gmail.com>

This removes all usage of gpio_remove retval
driver/gpio: 0001-gpio-remove-all-usage-of-gpio_remove-retval-in-drive
driver/pinctl: 0002-pinctrl-remove-all-usage-of-gpio_remove-ret-val-in-d
all the rest: 0003-driver-gpio-remove-all-usage-of-gpio_remove-retval-i

abdoulaye berthe (1):
  driver:gpio remove all usage of gpio_remove retval 

