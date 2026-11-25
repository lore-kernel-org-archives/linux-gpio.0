Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621931;
	b=Cq4Tan4daeCgNKrhP+IWXWcXIyjfGvFq3RNjytPsFbPW+ebnwBp0xY0Yf95iVssP0HnL
	 4BSK4qOoJ4Z9M/Gpu5cMNKPJFIn1KbtEWxQMQ8Gxyd2EGQTWpPZBF0cJbJ9RFjTf49tmC
	 U+qYwsQZUO7EqYxB7ONbRrKnHmcFgVpoGI6RyBVUd2CP7C3hsjNmdyg5XqlM15rs/GXUi
	 D7b78jgA1oQnHVet0KNV7lCVmyjkm48djqTrsLWp2MizlKxo48pRksiCNtrMI1DEhSbKo
	 wJB9PAYX660OpmmfQYDhnfrbfT0KMAVr4yMrv0oazL/cy3hPoboqGhJTddhyfIeAhuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621931;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=/EnrdYa4zjUO8ROpigORKfRZCh083G44JPXxwTfqGkU=;
	b=BTmOzBTO3y4g3xVEbZ7a+TX+KHbfdUuU79W9qw4cUsP0amLaBoVndmEYRiplbLFxcboJ
	 rAwSMaWOxuJeZFy9X3Q7xsYobhIVh7v9i5bjgC/CovPhh7cJxUbZChMQVzWtFqCYlsMjn
	 ECXe4wgZG57ICe2yb1fHRaq4ZDDQyN+hct+Mj51cIJxFby3iNKXCm6urOaKKP72so5JBc
	 TmwqdJpmS5oI2SZFVhUgX3tPUnBp31Q0pxRi0vyqaJiAYurD4aw9Vr58MldddwbO3MjIK
	 guo/4O1ENPlXYmUBWJe79wHi18n3vwJOKW38e6F8QiCSxcxTXSqR9W9yqgcOpch8BxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QiuxPtFp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id B660B606A321;
	Wed, 25 Nov 2026 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QiuxPtFp
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9F44C1F000C4;
	Wed, 25 Nov 2026 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621931;
	bh=/EnrdYa4zjUO8ROpigORKfRZCh083G44JPXxwTfqGkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QiuxPtFpAingxUV4CyMiNKqbY7tnUAqs0eoyXpv+sCCtBuRTK6a07o8hCOglmbm7J
	 RmxBA4Mjr8WOQnG8+rMPT/a1Wo7tVk3ic9xQCVn3YHUW791TX3Ms00kInEobB8rxSA
	 1d5DF6jB46axA+4yFSuaysLMeC0AJysbfkvKFI2SPQNhDJYehwqLxCaeUZXLvhXOBC
	 UUNZ5OKz6z6LgaXabE21Stgc2df/Q6NTnpImSLsuwhVfb6OBjDcw38DbxsNnB2yCkr
	 iQWh/7mUqM9xUmf44omKOAdWZWAdy2O3LCraw15/qnJgzTw5O4/PdZtM7MPCq1uVvo
	 zy6u6luQkLc+A==
Date: Wed, 25 Nov 2026 16:52:07 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/10] pinctrl: scmi: give no groups to pin-only
 functions
Message-ID: <zl45x6zxn4es5ynt65tbhzpmkqximjtencit64vjtkcoaosbbr@gtq4jq3ndodw>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
 <20261123-clegoffic-pinctrl-scmi-gpio-v3-5-d61f039be008@baylibre.com>
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
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-5-d61f039be008@baylibre.com>

On Mon, Nov 23, 2026 at 04:21:27PM +0100, Clément Le Goffic wrote:
> For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
> driver registered them as groups. Register pin-only functions without
> groups.
> 
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 
