From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v5 0/3] Add Renesas R8A7794 PFC support
Date: Sat, 06 Jun 2015 01:32:21 +0300
Message-ID: <4547979.iqiS3iOv3s@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35266 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbbFEWcZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jun 2015 18:32:25 -0400
Received: by lbbtu8 with SMTP id tu8so37872963lbb.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jun 2015 15:32:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, linux-sh@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org

Hello.

   Here's the set of 3 patches against the 'devel' branch of Linus Walleij's
'linux-pinctrl.git' repo. Here we add the PFC support for the Renesas R8A7794
SoC. The patches teaching the PFC driver to deal with "holes" in the pin array
are necessary for these patches to work (I didn't create a single series due to
the different patch versions of these 2 series).

[1/3] sh-pfc: add R8A7794 PFC support
[2/3] sh-pfc: r8a7794: add MMCIF pin groups
[3/3] sh-pfc: r8a7794: add SDHI pin groups

WBR, Sergei

