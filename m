From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/6] pinctrl: baytrail: Add pin control data structures
Date: Wed, 30 Mar 2016 14:15:01 +0300
Message-ID: <20160330111501.GS2099@lahna.fi.intel.com>
References: <1459171780-24856-1-git-send-email-cristina.ciocan@intel.com>
 <1459171780-24856-2-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459171780-24856-2-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: mathias.nyman@linux.intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 28, 2016 at 04:29:35PM +0300, Cristina Ciocan wrote:
> +/* SCORE pins */
> +static const struct pinctrl_pin_desc byt_score_pins[] = {
> +	PINCTRL_PIN(0, "SATA_GP[0]"),		/* GPIOC_0 */
> +	PINCTRL_PIN(1, "SATA_GP[1]"),		/* GPIOC_1 */

Maybe we should call these "SATA_GP0" and "SATA_GP1" like we do in other
Intel pinctrl drivers?

Also I don't think /* GPIOC_1 */ is really useful comment as that can be
derived already from the pin number.

Otherwise this looks good.
