From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix lookup of platform-mapped GPIOs
Date: Thu, 28 Nov 2013 15:33:57 +0100
Message-ID: <CACRpkdbJ9ogqjohaHOU=3c4R--jh7nhGB9oFGheP+6LX8T5u7A@mail.gmail.com>
References: <1385186152-29188-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385186152-29188-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 23, 2013 at 6:55 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> A typo resulted in GPIO lookup failing unconditionally.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reported-by: Stephen Warren <swarren@wwwdotorg.org>

Patch applied for fixes with Mika's ACK.

Yours,
Linus Walleij
