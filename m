From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/6] pinctrl: baytrail: Add pin control operations
Date: Mon, 4 Apr 2016 16:00:22 +0200
Message-ID: <CACRpkdZ0DM0ZJKZry1z+aQKcvFvQeFQOVGP5aK+eVmtqjemGrg@mail.gmail.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
	<1459508407-22011-3-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459508407-22011-3-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>, Octavian Purdila <octavian.purdila@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2016 at 1:00 PM, Cristina Ciocan
<cristina.ciocan@intel.com> wrote:

> Add implementation for:
>         - pin control, group information retrieval: count, name and pins
>         - pin muxing:
>                 - function information (count, name and groups)
>                 - mux setting
>                 - gpio control (enable, disable, set direction)
>         - pin configuration:
>                 - pull disable
>                 - pull up/down and pull strength
>                 - debounce
>                 - any other option is treated as not supported.
>
> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
