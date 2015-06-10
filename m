From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 0/3] Add Renesas R8A7794 PFC support
Date: Wed, 10 Jun 2015 10:17:43 +0200
Message-ID: <CACRpkdYLYeb7X52G7Et-6rXVpKpk67zAXB-UBO-vFFtrtLp+9Q@mail.gmail.com>
References: <4547979.iqiS3iOv3s@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:33711 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754217AbbFJIRo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 04:17:44 -0400
Received: by oiha141 with SMTP id a141so27417107oih.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 01:17:43 -0700 (PDT)
In-Reply-To: <4547979.iqiS3iOv3s@wasted.cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Jun 6, 2015 at 12:32 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

>    Here's the set of 3 patches against the 'devel' branch of Linus Walleij's
> 'linux-pinctrl.git' repo. Here we add the PFC support for the Renesas R8A7794
> SoC. The patches teaching the PFC driver to deal with "holes" in the pin array
> are necessary for these patches to work (I didn't create a single series due to
> the different patch versions of these 2 series).
>
> [1/3] sh-pfc: add R8A7794 PFC support
> [2/3] sh-pfc: r8a7794: add MMCIF pin groups
> [3/3] sh-pfc: r8a7794: add SDHI pin groups

Waiting for Laurent to review these patches.

Yours,
Linus Walleij
