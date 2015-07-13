From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [RFT PATCH] gpio: etraxfs: Fix devm_ioremap_resource return value check
Date: Mon, 13 Jul 2015 23:36:48 +0900
Message-ID: <CAAVeFuL-Rs8vUwcMNefZkx34Gn=6T1At1jf1EzXKrtdV=6ShRQ@mail.gmail.com>
References: <1436447993-24630-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33103 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751615AbbGMOhI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 10:37:08 -0400
In-Reply-To: <1436447993-24630-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>

On Thu, Jul 9, 2015 at 10:19 PM, Krzysztof Kozlowski
<k.kozlowski.k@gmail.com> wrote:
> Value returned by devm_ioremap_resource() was checked for non-NULL but
> devm_ioremap_resource() returns IOMEM_ERR_PTR, not NULL. In case of
> error this could lead to dereference of ERR_PTR.

Look obvious enough to be merged without testing.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
