Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500139;
	b=pW4MIYkOA1eTJJ1+V2uGSpndI0R0ibhqDgJBFYKHaIKQQoVLXj9QMO8ZuBHwmxsU9jtn
	 Ae6iP1Cp7qivV85iKry3N2bbvifSfRui3pagiwBRYkthQn+KecDHFZHf3r4AfgiXA0Yw0
	 uEb1m5g+yu7JyjRgXlewmQQbloUdJKYJh8E9obO6jSEZR1tJGyuSlbQdJWCKBFDSLRqhr
	 Lu3FkyGs13+DTXdBXZEAH3k98QigpCbomzIhQcm1utkGeU0pDAAy1o7nKm4sL+25Bo0X2
	 MHxtbcxAnz123fCaJ7457ATcf+YhN0npMf4QuPDDwAPoYbe7SjxNPwtFDvUpeL6XAcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500139;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=TbbHD4go/dfhhreSJi7b0LnLM06Sa55RvHaM/AMreFw=;
	b=Hxo1MVPNmnQK7pGscTwqtpsO0XOjrjr6u9QLNpjEyywq5OtEX8EbjiuvUZcYm3jR+WPi
	 puO/S+9csWNaw3xphd5TA5eEEc1ZWPFD6FJDYZD7cRnHavIi5mv68YG+8ZDN7U5CXvjKS
	 XjudaDd6Zl6d8fQKAgKNu7Byyv7Yq7NpaImB7qcZ5vHRZB+iIlNEqWUOP1DdyUxB3vfKs
	 k98kx+tIw6aujA/H5K9V8zZxtcQAQ0xhwJWK+D/102lPaNmYbd3ZHwLp8EeagwH0QK6IT
	 gMsuQtjeLT2n8uBS2MactDsZgEsAoxUil/aEjDkK++l1QHcFMcOnHTDOC4qNkFFXEaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZA9sF07K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6BC4160A2611;
	Thu, 12 Nov 2026 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZA9sF07K
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3CD3E1F0092B;
	Thu, 12 Nov 2026 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500139;
	bh=TbbHD4go/dfhhreSJi7b0LnLM06Sa55RvHaM/AMreFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZA9sF07KGz43c8vwZIoQJld7zvItYI/ivho7DBCXqi5ELSxzTRTuElkmYuYzr809G
	 5jSgWa6e2iCnBXGYyXbCvCUF3fiTAIykKj+JkMZdw0IN0w3elwEWuX/qF9+QLxNjCR
	 RV+hP/R098nxcRrv8soKuE6AOVaEX20jPRMEWxXEpa0GZ2sNZV0JDnf7RlrRfHNgv5
	 2mHGL2YynE2gdVhkU55ji7XQWavVQa5RAyLMgI95zt+nmy/ykh1vBlHWQBAnUjc9rC
	 AKnWW6DPKRMuXu4NnOe/GxjX4pu8VmGIPnpruY5hdPvC4Dq5gWem4DmHC4h9CD/5kq
	 64tXAT+67sGuA==
Date: Thu, 12 Nov 2026 17:15:35 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] pinctrl: scmi: report whether a function is GPIO
Message-ID: <dgeoiuzefy3dc2adw7b4m3temtxqh4upfca4tcwd4vgk2mszxm@2royrbgneufv>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-9-52d92843ad97@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-9-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:40PM +0100, Clément Le Goffic wrote:
> Use pinmux_generic_function_is_gpio() for the function_is_gpio
> operation.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
