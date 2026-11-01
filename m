Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571381;
	b=MbFrqDptL1eKJ7j5Z4PEKzApptJWfoAS9qAWEKc6KCJj8ptzXlzbLNeiVCKT5kXbwfRV
	 OSQPC2b+hQYVG/N4o8zWAh3aBGuMRRBcoLxuDg3nz4sWd+nQR7DNMRvZoadc5s55h4Fzl
	 qnVTfp8iiXOBqwxxRjnEpVeyHmjMvnz4AP16ZpsF5CQ3KQkUIENaCBgZdWmxfK7wMy2sV
	 +oiqWB2XKFk74hgaZUR0EXjPTNnb0WQO9Q5TnG7m83PYy4KoIhL1CHbrESFE/8bWf2KbF
	 AP/GESnbdwzLdQnTT7ivQSM4HGPDp2mzOonH7prxbtz2knOxO7FnrKqlZbINkixXtPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571381;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=dO8IDvnKbQ89guABqKeHsYCIoKDAIsVkhl3ddA1wtcc=;
	b=eVJ+9IZLGuNwuDR7VWBq8Ud9nbndtiATsdIBxwjA88EnIm/AARilWnYM0KRzw8QNi1TK
	 Kd98WZ9S1PNeSQGkNvZe8N3zOOFkOwpuSHOUux3iPoH+WAXUemW3dC1sDn4eYBSuwSYiU
	 CKXzFdaZBZk7YQcZ6bDi4g5VOqVxSho4U0cEYvPQ6Xy6FdAihAJqNyTZkf5x7P5nT/Fda
	 QOn/yng9eQkwhON68tfCYglfLMP+T5CnmoO63AUD3kEdPQEuuUjNT8Lwa0cdxXzsw5qk2
	 6aMtg1EbwCPDUubftXUtOyUfEOhmppXKnZqK2PsrhHVOK7CPmDQFV6nCj2hRCJFUUyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PKfbTIwU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91559606B075;
	Sun,  1 Nov 2026 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PKfbTIwU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F151F00A1F;
	Sun,  1 Nov 2026 22:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571381;
	bh=dO8IDvnKbQ89guABqKeHsYCIoKDAIsVkhl3ddA1wtcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PKfbTIwUwRg7utef2I61K+61rzrtDd/F/7eBveR00naBoqdh8F3uPt9bannBILkUq
	 FQXvy8Z0s5mkEUdeNhZmZVKFkBmt/LUE+5D1CvzgeMepBxoKf1PdLKC8RwoCB40Mf5
	 OdkcjsQ690c2MU+DctNOxnLmgdhbGaelLNRiN/qixigRpPtaiG2ijQmAVgt/H9pdCb
	 FiOvUSJsvaZ7CtN4srqpYrX5YQCsqj7N4Wxx4hnjOnXfuL07C7Ow54npn+WdSZ8oPe
	 Plja86Te6UpKeeKPM7LXj3NXO5VI//NBfrJ+Uv+0AsJVqmhPK+HaK/XHSo8YOL1C3I
	 iVVMD5YkVeKPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4025738003B8;
	Sun,  1 Nov 2026 22:16:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357137979.2624073.5964699004424197111.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:19 +0000
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, kernel@esmil.dk, pjw@kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, alex@ghiti.fr,
 p.zabel@pengutronix.de, brgl@kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 lianfeng.ouyang@starfivetech.com

Hello:

This series was applied to riscv/linux.git (fixes)
by Linus Walleij <linusw@kernel.org>:

On Thu, 10 Sep 2026 03:03:35 -0700 you wrote:
> The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
> per2, per2pok, per3, adc0, adc1, emmc, and vga.
> 
> In the current series, we will only add the following pinctrl:
>  - sys0, sys0h, sys1, sys2
>  - per0, per1, per2, per2pok, per3
> 
> [...]

Here is the summary with links:
  - [v8,01/22] dt-bindings: pincfg-node: Add property 'input-debounce-ns'
    https://git.kernel.org/riscv/c/5dde08ea70b9
  - [v8,02/22] pinctrl: pinconf-generic: Add property 'input-debounce-ns'
    (no matching commit)
  - [v8,03/22] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
    https://git.kernel.org/riscv/c/9d3dc8decb60
  - [v8,04/22] pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
    (no matching commit)
  - [v8,05/22] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
    https://git.kernel.org/riscv/c/6701c1c00891
  - [v8,06/22] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
    (no matching commit)
  - [v8,07/22] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
    https://git.kernel.org/riscv/c/bf8241062c79
  - [v8,08/22] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
    https://git.kernel.org/riscv/c/1d5c13990916
  - [v8,09/22] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
    https://git.kernel.org/riscv/c/941cc8022c21
  - [v8,10/22] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
    https://git.kernel.org/riscv/c/594deb7f74f4
  - [v8,11/22] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
    https://git.kernel.org/riscv/c/402323de0c04
  - [v8,12/22] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
    (no matching commit)
  - [v8,13/22] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
    https://git.kernel.org/riscv/c/d6001140c2e8
  - [v8,14/22] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
    (no matching commit)
  - [v8,15/22] dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
    https://git.kernel.org/riscv/c/b598855cc302
  - [v8,16/22] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
    (no matching commit)
  - [v8,17/22] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
    https://git.kernel.org/riscv/c/c9ed9daba98a
  - [v8,18/22] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
    (no matching commit)
  - [v8,19/22] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
    https://git.kernel.org/riscv/c/340588f9b94c
  - [v8,20/22] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
    (no matching commit)
  - [v8,21/22] riscv: dts: starfive: Add JHB100 pinctrl pad number header
    (no matching commit)
  - [v8,22/22] riscv: dts: starfive: jhb100: Add pinctrl nodes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


