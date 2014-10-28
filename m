From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: baytrail: show output gpio state correctly on
 Intel Baytrail
Date: Tue, 28 Oct 2014 11:17:35 +0100
Message-ID: <CACRpkdYzTP-uQCA_b=e9o7btkXxPXtawPjo9c44FT24Zo5qGow@mail.gmail.com>
References: <1413224639-21552-1-git-send-email-david.a.cohen@linux.intel.com>
	<1413309277-32485-1-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1413309277-32485-1-git-send-email-david.a.cohen@linux.intel.com>
Sender: stable-owner@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@ti.com>, stable <stable@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 14, 2014 at 7:54 PM, David Cohen
<david.a.cohen@linux.intel.com> wrote:

> Even if a gpio pin is set to output, we still need to set INPUT_EN
> functionality (by clearing INPUT_EN bit) to be able to read the pin's
> level.
>
> E.g. without this change, we'll always read low level state from sysfs.
>
> Cc: <stable@vger.kernel.org> # v3.14+
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: David Cohen <david.a.cohen@linux.intel.com>
> ---
>
> v1 to v2: improved patch's body description as requested by Felipe Balbi

This v2 version applied for fixes with Felipe's review tag.

Sorry for slow catching up with email :(

Yours,
Linus Walleij
