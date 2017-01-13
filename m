From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/6] pinctrl: Add a possibility to configure pins from
 a gpiolib based drivers
Date: Fri, 13 Jan 2017 16:36:42 +0100
Message-ID: <CACRpkdZjQipUkPxGTzJBF_L0EK8dg4wiW5DSCTft15aJ0UiLxQ@mail.gmail.com>
References: <20170110143201.53539-1-mika.westerberg@linux.intel.com>
 <20170110143201.53539-4-mika.westerberg@linux.intel.com> <CACRpkdbFotEknW2dK0ouc2HWLLhL-MERJS_BvCm5ux5hrEsQsg@mail.gmail.com>
 <20170111133304.GQ2330@lahna.fi.intel.com> <20170112092255.GX2330@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170112092255.GX2330@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2017 at 10:22 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Hmm, looking at users of .set_debounce() I can see that the debounce
> time can be quite large. For example some signals which are connected to
> physical push-buttons may need > 64ms debounce time.
>
> However, the current pinconfig value is defined to be unsigned long
> which on 32-bit architecture is 32-bits. From that the higher 16-bits
> are used as config leaving the value to be 16-bits. This gives maximum
> debounce time of 65535us. I don't think it can cover all the uses of
> .set_debounce(). This could also be problematic when specifying values
> for pull resistors.
>
> One solution is to convert the packed value to be u64 instead, leaving
> up to 48-bits for the value. Alternatively we could provide a scale
> field with the packed format.

Hm yeah as long as all in-kernel users survive I don't see why we
couldn't just make it 64bit. Is it a big deal?

A scale field (multiplier) can also work, I don't know which is most
elegant.

Yours,
Linus Walleij
