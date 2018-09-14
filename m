From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] pinctrl: icelake: Fix the resource number for community-4/5
Date: Fri, 14 Sep 2018 10:33:18 +0300
Message-ID: <CAHp75VcVkp6i_4oNVJvzde13MwaRQge91mvZF2aXgneZC9nzWg@mail.gmail.com>
References: <20180913223143.12664-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180913223143.12664-1-rajatja@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rajatxjain@gmail.com, subrata.banik@intel.com, aamir.bohra@intel.com
List-Id: linux-gpio@vger.kernel.org

On Fri, Sep 14, 2018 at 1:54 AM Rajat Jain <rajatja@google.com> wrote:
>
> The Icelake does not have a community-3, and the memory resources are
> laid out in the following order in the ACPI:
>
> resource-0: community-0 registers
> resource-1: community-1 registers
> resource-2: community-2 registers
> resource-3: community-4 registers
> resource-4: community-5 registers
>
> (EDS also describes the communities in the above order).
>
> Since the pinctrl driver exposes communities 0, 1, 4, 5, it needs to get
> the corresponding community registers by getting the resourse number right.
> Currently the resourse number is not correct for community 4 and 5, thus
> fix that.
>

Can you share link to the ACPI dump of the tables? (you may get one by
running `acpidump -o tables.dat`)

> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
>  drivers/pinctrl/intel/pinctrl-icelake.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/intel/pinctrl-icelake.c b/drivers/pinctrl/intel/pinctrl-icelake.c
> index 630b966ce081..5b4eaf7c90df 100644
> --- a/drivers/pinctrl/intel/pinctrl-icelake.c
> +++ b/drivers/pinctrl/intel/pinctrl-icelake.c
> @@ -331,8 +331,8 @@ static const struct intel_padgroup icllp_community5_gpps[] = {
>  static const struct intel_community icllp_communities[] = {
>         ICL_COMMUNITY(0, 0, 58, icllp_community0_gpps),
>         ICL_COMMUNITY(1, 59, 152, icllp_community1_gpps),
> -       ICL_COMMUNITY(2, 153, 215, icllp_community4_gpps),
> -       ICL_COMMUNITY(3, 216, 240, icllp_community5_gpps),
> +       ICL_COMMUNITY(3, 153, 215, icllp_community4_gpps),
> +       ICL_COMMUNITY(4, 216, 240, icllp_community5_gpps),
>  };
>
>  static const unsigned int icllp_spi0_pins[] = { 22, 23, 24, 25, 26 };
> --
> 2.19.0.397.gdd90340f6a-goog
>


-- 
With Best Regards,
Andy Shevchenko
