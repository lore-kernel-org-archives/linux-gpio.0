From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Added IRQF_SHARED flag for amd-pinctrl driver
Date: Mon, 8 Apr 2019 14:46:08 +0200
Message-ID: <CACRpkdaDbUULRDfTet-zLtyH6oeJijHDYCUewY9RfmMMtw+KEA@mail.gmail.com>
References: <1554383739-16050-1-git-send-email-Sandeep.Singh@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554383739-16050-1-git-send-email-Sandeep.Singh@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Singh, Sandeep" <Sandeep.Singh@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 4, 2019 at 3:16 PM Singh, Sandeep <Sandeep.Singh@amd.com> wrote:

> From: Sandeep Singh <sandeep.singh@amd.com>
>
> Some of the AMD reference boards used single GPIO line for
> multiple devices. So added IRQF_SHARED flag in amd pinctrl driver.
>
>
> Signed-off-by: Sandeep Singh <Sandeep.Singh@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> cc: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>

OK makes perfect sense so patch applied.

The patch itself looked funny when I tried to apply it but
as it's just a oneliner I managed to fix it up.

Yours,
Linus Walleij
