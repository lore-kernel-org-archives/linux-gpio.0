From: Peter Hung <hpeter@gmail.com>
Subject: [PATCH 0/2] gpio-f7188x: Add F81886 gpio function
Date: Tue, 12 Jan 2016 15:41:37 +0800
Message-ID: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:36337 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761762AbcALHlm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jan 2016 02:41:42 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, tom_tsai@fintek.com.tw, peter_hong@fintek.com.tw, Peter Hung <hpeter+linux_kernel@gmail.com>

Fintek F81886 SuperIO spec:
http://www.alldatasheet.com/datasheet-pdf/pdf/459085/FINTEK/F81866AD-I.html
The detail gpio check & configuration could be found within spec P126.

It controls gpio is the same with F7188x and has max 9 set of gpios.
The gpio address is below:
	GPIO0x based: 0xf0
	GPIO1x based: 0xe0
	GPIO2x based: 0xd0
	GPIO3x based: 0xc0
	GPIO4x based: 0xb0
	GPIO5x based: 0xa0
	GPIO6x based: 0x90
	GPIO7x based: 0x80
	GPIO8x based: 0x88 <-- not 0x70.

The first patch only add basic structure for F81866 to use all unverified
gpio, and second patch add filter function to make sure only enabled gpios
are exported.

Peter Hung (2):
  gpio-f7188x: add Fintek F81866 SuperIO support
  gpio-f7188x: filter non-export gpio for F81866

 drivers/gpio/gpio-f7188x.c | 176 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 175 insertions(+), 1 deletion(-)

-- 
1.9.1

