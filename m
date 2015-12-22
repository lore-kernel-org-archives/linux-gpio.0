From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] pinctrl: sh-pfc: add missing of_node_put
Date: Tue, 22 Dec 2015 13:47:21 +0100
Message-ID: <CACRpkdbmG8h31EFJMHFC2nx3vp4_G2ZR-wvOmioF5eh5YmVn7w@mail.gmail.com>
References: <1450715988-4770-1-git-send-email-Julia.Lawall@lip6.fr>
	<1450715988-4770-4-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <1450715988-4770-4-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel-janitors@vger.kernel.org, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 21, 2015 at 5:39 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> for_each_child_of_node performs an of_node_get on each iteration, so a
> goto out of the loop requires an of_node_put.
>
> A simplified version of the semantic patch that fixes this problem is as
> follows (http://coccinelle.lip6.fr):

Patch applied with Laurent's ACK.

Geert: since I don't think you're gonna send me more pull
requests before the merge window I went ahead and applied
this directly, OK?

Yours,
Linus Walleij
