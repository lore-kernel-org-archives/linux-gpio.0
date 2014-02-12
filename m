From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] gpio: ich: Add support for multiple register addresses
Date: Wed, 12 Feb 2014 16:10:21 +0100
Message-ID: <CACRpkdaac-UJkYMQmU8ozxVFqtzG1-ZmCJ=hNvWqBh69TOGmwg@mail.gmail.com>
References: <1391779267-27084-1-git-send-email-vdonnefort@lacie.com>
	<1391779267-27084-4-git-send-email-vdonnefort@lacie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33369 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218AbaBLPKW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2014 10:10:22 -0500
Received: by mail-ob0-f182.google.com with SMTP id wm4so10650386obc.13
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2014 07:10:22 -0800 (PST)
In-Reply-To: <1391779267-27084-4-git-send-email-vdonnefort@lacie.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vincent Donnefort <vdonnefort@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

On Fri, Feb 7, 2014 at 2:21 PM, Vincent Donnefort <vdonnefort@gmail.com> wrote:

> From: Vincent Donnefort <vdonnefort@gmail.com>
>
> This patch introduces regs and reglen pointers which allow a chipset to have
> register addresses differing from ICH ones.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@gmail.com>

OK parametrize this, I get the idea.
Patch applied.

Yours,
Linus Walleij
