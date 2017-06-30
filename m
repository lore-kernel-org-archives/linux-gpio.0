From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register offset calculation
Date: Fri, 30 Jun 2017 14:16:47 +0200
Message-ID: <CACRpkdaZAJO6GzgeSpQUFdxsou2-NTtytvT1qqK+bkTAk2Pt+Q@mail.gmail.com>
References: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <CACRpkdY83WvJ_PzzdEwzgHEFBm=ixLGLqCYdpkArWPFBa7U2Kw@mail.gmail.com> <20170629202857.359bec9d@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170629202857.359bec9d@alans-desktop>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Graeme Gregory <graeme.gregory@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 29, 2017 at 9:28 PM, Alan Cox <gnomes@lxorguk.ukuu.org.uk> wrote:

>> General-purpose input/output - yeah that sounds like something
>> going in/out of the system right?
>
> It's become an ACPI interface for controlling all sorts of system state
> in a way that works nicely in Windows. Rightly or wrongly that's the
> situation and we are still the tail not the dog.

I see. Well I maintain it right now and I want these systems to work
so I guess I just have to carry it forward like this, sigh.

Thanks for the detailed explanation.

Yours,
Linus Walleij
