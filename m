From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/13] pinctrl: Drop TZ1090 drivers
Date: Thu, 1 Mar 2018 15:34:09 +0100
Message-ID: <CACRpkdb6t6Tb-NeOoMkL-QVxEAiCMW6EF6qZKWVTS05+=1B35Q@mail.gmail.com>
References: <20180221233825.10024-1-jhogan@kernel.org> <20180221233825.10024-10-jhogan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180221233825.10024-10-jhogan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>
Cc: linux-metag@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 22, 2018 at 12:38 AM, James Hogan <jhogan@kernel.org> wrote:

> Now that arch/metag/ has been removed, along with TZ1090 SoC support,
> remove the TZ1090 pinctrl drivers. They are of no value without the
> architecture and SoC platform code.
>
> Signed-off-by: James Hogan <jhogan@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-metag@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
