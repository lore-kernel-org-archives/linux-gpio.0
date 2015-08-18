From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add Renesas R8A7794 USB/VIN PFC support
Date: Wed, 19 Aug 2015 01:25:32 +0300
Message-ID: <13219129.kD4pZSmcAP@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:36721 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751526AbbHRWZg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2015 18:25:36 -0400
Received: by lbbpu9 with SMTP id pu9so112600398lbb.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2015 15:25:35 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-sh@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org

Hello.

   Here's the set of 2 patches against the 'devel' branch of Linus Walleij's
'linux-pinctrl.git' repo. Here we add the PFC support for the Renesas R8A7794
SoC's USB and VIN devices.

[1/2] pinctrl: sh-pfc: r8a7794: add USB pin groups
[2/2] pinctrl: sh-pfc: r8a7794: add VIN pin groups

WBR, Sergei

