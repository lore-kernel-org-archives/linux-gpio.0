From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v5 0/3] TPS68470 PMIC drivers
Date: Fri, 21 Jul 2017 22:51:02 +0200
Message-ID: <3425487.LgIRMVflim@aspire.rjw.lan>
References: <1500648378-10294-1-git-send-email-rajmohan.mani@intel.com> <CAHp75VdMgXJ6g8g+mv1GATaKFn1SLPOHUc7-ciMz4EpjjjHQYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdMgXJ6g8g+mv1GATaKFn1SLPOHUc7-ciMz4EpjjjHQYg@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajmohan Mani <rajmohan.mani@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Len Brown <lenb@kernel.org>, sakari.ailus@linux.intel.com
List-Id: linux-gpio@vger.kernel.org

On Friday, July 21, 2017 06:20:15 PM Andy Shevchenko wrote:
> On Fri, Jul 21, 2017 at 5:46 PM, Rajmohan Mani <rajmohan.mani@intel.com> wrote:
> > This is the patch series for TPS68470 PMIC that works as a camera PMIC.
> >
> > The patch series provide the following 3 drivers, to help configure the voltage regulators, clocks and GPIOs provided by the TPS68470 PMIC, to be able to use the camera sensors connected to this PMIC.
> >
> > TPS68470 MFD driver:
> > This is the multi function driver that initializes the TPS68470 PMIC and supports the GPIO and Op Region functions.
> >
> > TPS68470 GPIO driver:
> > This is the PMIC GPIO driver that will be used by the OS GPIO layer, when the BIOS / firmware triggered GPIO access is done.
> >
> > TPS68470 Op Region driver:
> > This is the driver that will be invoked, when the BIOS / firmware configures the voltage / clock for the sensors / vcm devices connected to the PMIC.
> >
> 
> All three patches are good to me (we did few rounds of internal review
> before posting v4)
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

OK, so how should they be routed?

Thanks,
Rafael

