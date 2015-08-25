From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl-zynq.c: Fix typos in smc0_nand_grp and smc0_nor_grp
Date: Tue, 25 Aug 2015 16:22:50 +0200
Message-ID: <CACRpkdbv63vTZEDncPc4BPK09xNiWRd=+1xtvRVZr7kN4ncZ=w@mail.gmail.com>
References: <1439389332-9373-1-git-send-email-mike.looijmans@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36168 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750755AbbHYOWu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2015 10:22:50 -0400
Received: by oiev193 with SMTP id v193so101453688oie.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2015 07:22:50 -0700 (PDT)
In-Reply-To: <1439389332-9373-1-git-send-email-mike.looijmans@topic.nl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>

On Wed, Aug 12, 2015 at 4:22 PM, Mike Looijmans <mike.looijmans@topic.n=
l> wrote:

> Group names should be smc0_nand_grp and smc0_nor_grp, otherwise you'l=
l
> get errors like this if you try to pinmux them via the devicetree:
> zynq-pinctrl 700.pinctrl: invalid group "smc0_nand_grp" for function =
"smc0_nand"
>
> Probably a typo while creating these tables.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>

Patch applied with Moritz' ACK.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
