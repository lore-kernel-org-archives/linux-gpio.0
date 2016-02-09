From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: stm32: Remove dependency with DT bindings
 header files
Date: Tue, 9 Feb 2016 10:53:01 +0100
Message-ID: <CACRpkdb+V8O8H1gjkWwgqSimFtgJ2rFnwdY0sCChEjFSCkOO8w@mail.gmail.com>
References: <1454954259-4923-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1454954259-4923-2-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:33915 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753107AbcBIJxC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2016 04:53:02 -0500
Received: by mail-ob0-f176.google.com with SMTP id wb13so183508499obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Feb 2016 01:53:01 -0800 (PST)
In-Reply-To: <1454954259-4923-2-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice CHOTARD <patrice.chotard@st.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>

On Mon, Feb 8, 2016 at 6:57 PM, Maxime Coquelin
<mcoquelin.stm32@gmail.com> wrote:

> Some macros where defined in DT bindings headers, whereas only used
> in the driver.
>
> This patch moves these macros to the driver side.
>
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>

Patch applied.

Yours,
Linus Walleij
