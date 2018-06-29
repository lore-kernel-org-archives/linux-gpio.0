From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: Pass along set_wake failures
Date: Fri, 29 Jun 2018 09:58:54 +0200
Message-ID: <CACRpkdZCUnqLCP8Hr05_V_z+Tzw4Ke7c-DPbaLmhjzJJYGX-1w@mail.gmail.com>
References: <20180619234349.166190-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619234349.166190-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: evgreen@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 20, 2018 at 1:45 AM Evan Green <evgreen@chromium.org> wrote:

> The MSM pinctrl driver quietly swallows errors that occur
> when trying to call .irq_set_wake. It should instead pass
> those failures up the chain so the caller can react to them.
> Swallowing the error for instance causes gpio_keys to think that
> it was able to successfully set a wake IRQ, when in fact it may
> not have been, causing the following warning on resume:
>
> [   53.777819] Unbalanced IRQ 9 wake disable
> [   53.781979] WARNING: CPU: 0 PID: 1362 at kernel/irq/manage.c:623
> irq_set_irq_wake+0xac/0x12c
> [   53.794758] Modules linked in: spi_gpio spi_bitbang qcom_q6v5_pil
> qcom_common cfg80211 ip6table_filter smsc95xx usbnet mii
> [   54.016419] [<ffffff80081054b0>] irq_set_irq_wake+0xac/0x12c
> [   54.022252] [<ffffff80083c86a4>] msm_gpio_irq_set_wake+0x48/0x68
> [   54.028447] [<ffffff8008104d8c>] set_irq_wake_real+0x50/0x5c
> [   54.034275] [<ffffff80081054d0>] irq_set_irq_wake+0xcc/0x12c
> [   54.040104] [<ffffff800860fd00>] gpio_keys_resume+0x74/0xd8
> [   54.045846] [<ffffff800852018c>] platform_pm_resume+0x54/0x60
> [   54.051771] [<ffffff800852ceb4>] dpm_run_callback+0x104/0x210
> [   54.057694] [<ffffff800852d7cc>] device_resume+0x178/0x1b0
> [   54.063355] [<ffffff800852e938>] dpm_resume+0x1c4/0x38c
> [   54.068745] [<ffffff800852efac>] dpm_resume_end+0x20/0x34
> [   54.074315] [<ffffff80080fe700>] suspend_devices_and_enter+0x518/0x964
> [   54.081044] [<ffffff80080ff1dc>] pm_suspend+0x690/0x6e0
> [   54.086433] [<ffffff80080fd0f8>] state_store+0xd4/0xf8
> [   54.091733] [<ffffff80088a3af0>] kobj_attr_store+0x18/0x28
> [   54.097396] [<ffffff80082980a4>] sysfs_kf_write+0x5c/0x68
> [   54.102961] [<ffffff8008297050>] kernfs_fop_write+0x174/0x1b8
> [   54.108887] [<ffffff800821a9c0>] __vfs_write+0x58/0x160
> [   54.114276] [<ffffff800821acd4>] vfs_write+0xcc/0x184
> [   54.119487] [<ffffff800821af4c>] SyS_write+0x64/0xb4
>
> Signed-off-by: Evan Green <evgreen@chromium.org>

Bj=C3=B6rn is this patch OK with you? Seems fine to me.

Yours,
Linus Walleij
