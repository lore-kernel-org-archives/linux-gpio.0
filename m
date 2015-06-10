From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v5 0/3] Add Renesas R8A7794 PFC support
Date: Wed, 10 Jun 2015 14:57:01 +0300
Message-ID: <5578260D.7040704@cogentembedded.com>
References: <4547979.iqiS3iOv3s@wasted.cogentembedded.com> <CACRpkdYLYeb7X52G7Et-6rXVpKpk67zAXB-UBO-vFFtrtLp+9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:34079 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753877AbbFJL5P (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 07:57:15 -0400
Received: by laew7 with SMTP id w7so31275883lae.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 04:57:13 -0700 (PDT)
In-Reply-To: <CACRpkdYLYeb7X52G7Et-6rXVpKpk67zAXB-UBO-vFFtrtLp+9Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello.

On 6/10/2015 11:17 AM, Linus Walleij wrote:

>>     Here's the set of 3 patches against the 'devel' branch of Linus Walleij's
>> 'linux-pinctrl.git' repo. Here we add the PFC support for the Renesas R8A7794
>> SoC. The patches teaching the PFC driver to deal with "holes" in the pin array
>> are necessary for these patches to work (I didn't create a single series due to
>> the different patch versions of these 2 series).

    Since no other R8A7794 patches have been merged yet, you can even merge 
these patches right away.

>> [1/3] sh-pfc: add R8A7794 PFC support
>> [2/3] sh-pfc: r8a7794: add MMCIF pin groups
>> [3/3] sh-pfc: r8a7794: add SDHI pin groups

> Waiting for Laurent to review these patches.

    The previous version was already ACKed by Laurent, and there was no 
significant changes since then.

> Yours,
> Linus Walleij

WBR, Sergei

