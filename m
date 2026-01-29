Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FB33E35C;
	Thu, 29 Jan 2026 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703461; cv=none; b=r/fmuRy1B4Bts/fM68fdFit8msH0jt7A0kL6BB5las12I4Not7pwdtnU5pTJ4QoDMwWHQsBzrdRvPMK8zeC8YPKCgBO1jK24TZDi1lkJUE5meadGQq2Xh3JQfmyfVFeVr6gpJgNer1HlMx38IRYNBUpbl5OaX61mwPLzca5aWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703461; c=relaxed/simple;
	bh=KufZgQNtbJ6Ya6x3/R6zEkba70EXrw7je3QvW4vFFRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgRSq5AkeMMUxn0SKc1hbrOkyeNuNGcK8Bmp2O02QAOHtU9qzmc9hNXf/LAWxuPS3lR61nc4+hdwollOHkCQEsNKzPeoHoUskqpbjap+cjpvSYtBNuME+WH6jKm4sme8Uq7IjYRvkUdyCZxJBGgQ8L48VT8tF+4qYdzPdAst7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRpxmjrr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRpxmjrr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540E4C116D0;
	Thu, 29 Jan 2026 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769703461;
	bh=KufZgQNtbJ6Ya6x3/R6zEkba70EXrw7je3QvW4vFFRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRpxmjrrdvCr2X0JY8D+iNKWMd0TgpUAgpcjqDJdnnHCj79z3ve+YVyGWVAl+EZ4f
	 bgZ5lzWL3umobnDZm7u+tcHgD8D42LNUpP/RgTfBu/YY7YDqi+2QSezQy/3ZOqbf7j
	 qnk+YmBc76ILBd50OGuUCF8tVvlHDs2AsuwZD0yhnEA3q83wltK/weBc/WQXeahhWq
	 KdScsviIDmU9Wd2JCBzQtof7DILvMUjedsLM/VHtm71hvdEz5dMA0uo5yVzda62Heh
	 q0VfrBCl7kNNe470XTK2RMjUFgDbc0XIftaCogzb0u3Z9MbXeJd4Y5TCNzYUCuD5qx
	 twYWoHNUlcFJg==
Date: Thu, 29 Jan 2026 10:17:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	jens.wiklander@linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	coresight@lists.linaro.org, Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Leo Yan <leo.yan@linux.dev>, Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: bus: document the stm32 debug bus
Message-ID: <176970345958.1208851.15019690954593633127.robh@kernel.org>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-debug_bus-v5-3-90b670844241@foss.st.com>


On Fri, 23 Jan 2026 11:39:00 +0100, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

