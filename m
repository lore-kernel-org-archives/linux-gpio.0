From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: st: add irq_request/release_resources callbacks
Date: Thu, 23 Mar 2017 10:11:15 +0100
Message-ID: <CACRpkdYABEc+Mxmki9p7bJQ9KUg7ZrhygQRuAs7yXV=cUD9ujg@mail.gmail.com>
References: <1489685162-3003-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489685162-3003-1-git-send-email-patrice.chotard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Lee Jones <lee.jones@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 16, 2017 at 6:26 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> When using GPIO as IRQ source, the GPIO must be configured
> in INPUT. Callbacks dedicated for this was missing in
> pinctrl-st driver.
>
> This fix the following kernel error when trying to lock a gpio
> as IRQ:
>
> [    7.521095] gpio gpiochip7: (PIO11): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
> [    7.526018] gpio gpiochip7: (PIO11): unable to lock HW IRQ 6 for IRQ
> [    7.529405] genirq: Failed to request resources for 0-0053 (irq 81) on irqchip GPIO
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Patch applied for fixes.

Yours,
Linus Walleij
