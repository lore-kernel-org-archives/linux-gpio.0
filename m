From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-lynxpoint: Fix warning about unbalanced pm_runtime_enable
Date: Fri, 16 Aug 2013 17:11:57 +0200
Message-ID: <CACRpkda23Ondh-soq645EzdwDvBhvQpnyXczVY8qtLbxh6L7UA@mail.gmail.com>
References: <1376305541-5857-1-git-send-email-mathias.nyman@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376305541-5857-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2013 at 1:05 PM, Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:

> Missing pm_runtime_disable call in driver remove path caused
> an unbalanaced pm_runtime_enable warning when driver was reloaded
>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Patch applied, thanks!

Yours,
Linus Walleij
