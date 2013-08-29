From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: add GPIO support for F71882FG and F71889F
Date: Thu, 29 Aug 2013 19:35:16 +0200
Message-ID: <CACRpkdZkPZF++MRfNc4-W-cxUCYafdJ+rcCF+2Mk4ntBkwU62g@mail.gmail.com>
References: <1374486633-9737-1-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374486633-9737-1-git-send-email-simon.guinot@sequanux.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2013 at 11:50 AM, Simon Guinot
<simon.guinot@sequanux.org> wrote:

> This patch adds support for the GPIOs found on the Fintek super-I/O
> chips F71882FG and F71889F.
>
> A super-I/O is a legacy I/O controller embedded on x86 motherboards. It
> is used to connect the low-bandwidth devices. Among others functions the
> F71882FG/F71889F provides: a parallel port, two serial ports, a keyboard
> controller, an hardware monitoring controller and some GPIO pins.
>
> Note that this super-I/Os are embedded on some Atom-based LaCie NASes.
> The GPIOs are used to control the LEDs and the hard drive power.
>
> Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> ---
> Changes since v2:
> - Remove useless NULL setters for driver data.

OK we had some discussion on this: there seem to be no alternatives
to port probing, and hacking these board drivers is mighty cool, so
patch applied.

Yours,
Linus Walleij
