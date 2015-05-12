From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: Remove r8a73a4 platform_device_id entry
Date: Tue, 12 May 2015 09:28:40 +0200
Message-ID: <CACRpkdYS1K5x_Wj3ABrX5n13+JRNfCcqPuzdjVuvQo-+gB_K9Q@mail.gmail.com>
References: <1430216107-31501-1-git-send-email-geert+renesas@glider.be>
	<1430216107-31501-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35207 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932066AbbELH2k (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:28:40 -0400
Received: by obcus9 with SMTP id us9so88539624obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 00:28:40 -0700 (PDT)
In-Reply-To: <1430216107-31501-2-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 28, 2015 at 12:15 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> As of commit 9d07d414d4c33d86 ("ARM: shmobile: r8a73a4: ape6evm: Remove
> legacy platform"), r8a73a4 is only supported in generic DT-only ARM
> multi-platform builds.  The driver doesn't need to match platform
> devices by name anymore, hence remove the corresponding
> platform_device_id entry.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied with all ACKs.

Yours,
Linus Walleij
