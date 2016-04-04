From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/6] pinctrl: baytrail: Update irq chip operations
Date: Mon, 4 Apr 2016 16:11:15 +0200
Message-ID: <CACRpkdagrk36J6o=aGdN4niFiAhPi_9CDGFAsx9WzVigVxsfBA@mail.gmail.com>
References: <1459508407-22011-1-git-send-email-cristina.ciocan@intel.com>
	<1459508407-22011-5-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459508407-22011-5-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Irina Tirdea <irina.tirdea@intel.com>, Octavian Purdila <octavian.purdila@intel.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2016 at 1:00 PM, Cristina Ciocan
<cristina.ciocan@intel.com> wrote:

> This patch updates the irq chip implementation in order to interact with
> the pin control chip model: the chip contains reference to SOC data and
> pin/group/community information is retrieved through the SOC reference.
>
> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
