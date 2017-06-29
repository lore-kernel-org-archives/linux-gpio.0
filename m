From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: Fix GPIO control register offset calculation
Date: Thu, 29 Jun 2017 15:30:06 +0300
Message-ID: <CAHp75VeY0beV-TxXpyc7gSW5jPs0da2wnRt-WrikdQ4CSxKjJw@mail.gmail.com>
References: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4b57167184fa9aa4d1c183d4c8df6e6a600a7dbd.1498087915.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
List-Id: linux-gpio@vger.kernel.org

+Cc: Hans

On Mon, Jun 26, 2017 at 8:37 PM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> According to Whiskey Cove PMIC GPIO controller specification, for GPIO
> pins 0-12, GPIO input and output register control address range from,
>
> 0x4e44-0x4e50 for GPIO outputs control register
>
> 0x4e51-0x4e5d for GPIO input control register
>
> But, currently when calculating the GPIO register offsets in to_reg()
> function, all GPIO pins in the same bank uses the same GPIO control
> register address. This logic is incorrect. This patch fixes this
> issue.

>
> This patch also adds support to selectively skip register modification
> for virtual GPIOs.
>
> In case of Whiskey Cove PMIC, ACPI code may use up 94 virtual GPIOs.
> These virtual GPIOs are used by the ACPI code as means to access various
> non GPIO bits of PMIC. So for these virtual GPIOs, we don't need to
> manipulate the physical GPIO pin register. A similar patch has been
> merged recently by Hans for Crystal Cove PMIC GPIO driver. You can
> find more details about it in Commit 9a752b4c9ab9 ("gpio: crystalcove:
> Do not write regular gpio registers for virtual GPIOs")

For me (disregards to content of the patch) the question is: did we
ever have a *working* solution looking to the bug fixes on this
driver?!

I would suggest to stop applying patches on Intel PMICs without
Tested-by tag from independent testers.

Hans, do you have anything to add / comment on this?

-- 
With Best Regards,
Andy Shevchenko
