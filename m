From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add missing includes in machine.h
Date: Thu, 7 Aug 2014 11:55:32 +0200
Message-ID: <CACRpkdZXxwRF7=HiOasPRecGuYFX3zzbSL192ynF8gXN=2W4Pw@mail.gmail.com>
References: <1407125156-14269-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1407125156-14269-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 4, 2014 at 6:05 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> linux/types.h and linux/list.h should be included so the typed used in
> the header file are always properly declared.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied, preparing for the v3.17 pull request.

Yours,
Linus Walleij
