From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: stm32: add syscfg mask parameter
Date: Sun, 29 Jul 2018 22:15:52 +0200
Message-ID: <CACRpkdbEnLh-SYK5vo5oUV9MnDQAiObcKdpqzTdPq2aj52VShQ@mail.gmail.com>
References: <1531821387-29845-1-git-send-email-ludovic.Barre@st.com> <1531821387-29845-3-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531821387-29845-3-git-send-email-ludovic.Barre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 17, 2018 at 11:56 AM Ludovic Barre <ludovic.Barre@st.com> wrote:

> From: Ludovic Barre <ludovic.barre@st.com>
>
> This patch adds mask parameter to define IRQ mux field.
> This field could vary depend of IRQ mux selection register.
> To avoid backward compatibility, the drivers set
> the legacy value by default.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Patch applied with Alexandre's ACK.

Yours,
Linus Walleij
