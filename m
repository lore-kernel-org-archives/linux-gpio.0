From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] pinctrl STM32 updates
Date: Wed, 20 Feb 2019 10:41:43 +0100
Message-ID: <CACRpkdbaBzRZTea4nmm8b-wt9iUipPLaY1MbaAKEPxoY+HFVjA@mail.gmail.com>
References: <1550163266-19975-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550163266-19975-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 14, 2019 at 5:54 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Please find 2 updates for STM32 pinctrl driver:
>
>  -Fix a memory leak issue present since the beginning of the driver.
>  -Handle error case when a hwspinlock can't get locked.

Patches applied for v5.1.

Yours,
Linus Walleij
