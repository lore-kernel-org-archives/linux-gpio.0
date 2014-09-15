From: Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: Using audio codec pins as gpio. Device tree configuration.
Date: Mon, 15 Sep 2014 10:00:23 -0700
Message-ID: <CAOMFOmVaTopMPdQp_XeugOLhxgWeGEQSAyCFXjvSqhOHC5DV_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f181.google.com ([209.85.220.181]:62798 "EHLO
	mail-vc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224AbaIORAY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Sep 2014 13:00:24 -0400
Received: by mail-vc0-f181.google.com with SMTP id ij19so3660784vcb.40
        for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2014 10:00:23 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi

A question that might sound like a nooby one but I cant really google
any useful results.

I want to use audio codec (rt5677) pins as gpio. I need those gpio's
to create a fixed-regulator.

Realtek developers sent a patch that creates gpio_chip for audio codec
pins http://mailman.alsa-project.org/pipermail/alsa-devel/2014-September/081244.html

The next question is how to use these codec pins in DTS. Looking at
other examples I believe my regulator should look like

reg_audio: rt5677_supply {
  compatible = "regulator-fixed";
  regulator-name = "rt5677-supply";
  gpio = <&?????? ???? 0>;
  enable-active-high;
};

And the question what should be used for "gpio" property? I mean what
is the name of gpio controller and what gpio number should be used.
Realtek developers use

rt5677->gpio_chip.base = -1;

that dynamically assigns gpio numbers and I don't really know what
gpio number is used for PIN2 of my audio codec.

Thanks for you reply in advance.
