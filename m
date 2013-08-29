From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] gpio: (gpio-pca953x) move header to linux/platform_data/
Date: Thu, 29 Aug 2013 11:00:40 -0700
Message-ID: <20130829180040.GI18542@quad.lixom.net>
References: <ADE657CA350FB648AAC2C43247A983F0021DAC7DA184@AUSP01VMBX24.collaborationhost.net>
 <1859873512.636800.1377798778897.JavaMail.root@mail>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1859873512.636800.1377798778897.JavaMail.root@mail>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: arm@kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, linux-gpio@vger.kernel.org, kernel@savoirfairelinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, H Hartley Sweeten <hartleys@visionengravers.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 29, 2013 at 01:52:58PM -0400, Vivien Didelot wrote:
> As this patch mainly touches arch/arm/*, Olof/Kevin, would you mind
> applying it?
> 
> The first message in thread is here: https://lkml.org/lkml/2013/7/31/552
> Here are the previous ACKs:
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>

Looks like i2c or gpio maintainers should be taking it, but since Linus acked
it instead of applied it, I guess we can take it. :)

I'll apply it to next/cleanup for 3.12 if you resend me the patch with the
acks. Thanks!


-Olof
