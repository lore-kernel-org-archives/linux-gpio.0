From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: baytrail: Serialize all register access
Date: Thu, 13 Aug 2015 14:26:49 +0200
Message-ID: <CACRpkdbC4uCjuDXRdbKdw1eH2hQV+=r3naysLJM-J-JAGsLX5w@mail.gmail.com>
References: <1438689794-14355-1-git-send-email-mika.westerberg@linux.intel.com>
	<1438689794-14355-2-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438689794-14355-2-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 4, 2015 at 2:03 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> There is a hardware issue in Intel Baytrail where concurrent GPIO register
> access might result reads of 0xffffffff and writes might get dropped
> completely.
>
> Prevent this from happening by taking the serializing lock in all places
> where it is possible that more than one thread might be accessing the
> hardware concurrently.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Same comment here about the fastpath and the RT raw spinlocks.

Yours,
Linus Walleij
