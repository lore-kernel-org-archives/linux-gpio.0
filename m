From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 0/3] Remove non-existing GPIO pins for R8A7790/1
Date: Fri, 26 Jun 2015 01:39:14 +0300
Message-ID: <1460630.GxHT4lRd7u@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:33372 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750993AbbFYWjS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2015 18:39:18 -0400
Received: by laka10 with SMTP id a10so53589485lak.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2015 15:39:16 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-sh@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org

Hello.

   Here's the set of 3 patches against the 'fixes' branch of Linus Walleij's
'linux-pinctrl.git' repo. Here we eliminate the pin array "holes" on R-Car SoCs
and then remove unused GPIO pins for R8A7790/1.

[1/3] sh-pfc: fix sparse GPIOs for R-Car SoCs
[2/3] sh-pfc: r8a7790 remove non-existing GPIO pins
[3/3] sh-pfc: r8a7791 remove non-existing GPIO pins

WBR, Sergei

