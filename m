From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/39] gpio: remove DEFINE_PCI_DEVICE_TABLE macro
Date: Tue, 3 Dec 2013 13:16:43 +0100
Message-ID: <CACRpkdYBiSSgpSvJAARK5uUwNqqVTNc_iqVs3=SXg4FWfoa1xw@mail.gmail.com>
References: <001501ceefb1$69c96820$3d5c3860$%han@samsung.com>
	<001d01ceefb3$733b8cb0$59b2a610$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:64683 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751965Ab3LCMQo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2013 07:16:44 -0500
Received: by mail-ob0-f172.google.com with SMTP id gq1so14387343obb.31
        for <linux-gpio@vger.kernel.org>; Tue, 03 Dec 2013 04:16:43 -0800 (PST)
In-Reply-To: <001d01ceefb3$733b8cb0$59b2a610$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Dec 3, 2013 at 12:08 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> Don't use DEFINE_PCI_DEVICE_TABLE macro, because this macro
> is not preferred.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
