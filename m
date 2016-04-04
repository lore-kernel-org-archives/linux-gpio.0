From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/6] pinctrl: baytrail: Add pin control data structures
Date: Mon, 4 Apr 2016 15:57:50 +0200
Message-ID: <CACRpkdYDPyQiEpxLcZSK35zdDe3MwyxBADwMBcoRnZoz3jbstQ@mail.gmail.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
	<1459508407-22011-2-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459508407-22011-2-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>, Octavian Purdila <octavian.purdila@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2016 at 1:00 PM, Cristina Ciocan
<cristina.ciocan@intel.com> wrote:

> In order to implement pin control for Baytrail, we need data structures
> in which to store and pass along pin, group, function, community and SOC
> data information.
>
> Baytrail has 3 GPIO controllers. Add SCORE, NCORE and SUS controller data:
>         - pins (for all controllers),
>         - pad map for pins (for all controllers; we need this since pads
>         are not ordered),
>         - groups (for SCORE and SUS controllers),
>         - functions (for SCORE and SUS controllers),
>         - communities (for all controllers),
>         - soc specific data gathering all of the above and the ACPI UID
>         (for all controllers)
> This information is useful for pin control functionality. NCORE data is
> lighter than the other two controllers' due to lack of pin documentation in
> the public datasheet.
>
> Datasheet:
> http://www.intel.com/content/www/us/en/embedded/products/bay-trail/atom-e3800-family-datasheet.html
>
> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
