From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: generic: add get_direction support
Date: Mon, 15 Jun 2015 11:32:06 +0900
Message-ID: <CAAVeFuKJbEAa05SPhN7NoEB5cnFq_5eJhNFN4bs7g8C=JsfY+w@mail.gmail.com>
References: <1434126035-18596-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33422 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752739AbbFOCc0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Jun 2015 22:32:26 -0400
In-Reply-To: <1434126035-18596-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Sat, Jun 13, 2015 at 1:20 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Allow to determine the current direction configuration by
> reading back from the direction register.

Interesting that this was missing.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
