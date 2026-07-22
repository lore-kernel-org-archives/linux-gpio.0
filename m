Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5AD402442;
	Wed, 22 Jul 2026 17:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740427; cv=none; b=HTxiJZhM+meJFB1eaZC2iRK7IRjSZc8L58d4sGHsudTtD8sjDXwJaWfhZ9bCl7uKohk7hyKFUF0kDyxZX6lcNRX8YP09LiQyD7MyICl6hvGVY6awrQpnF51b4uE75ljVaQcmygFEvuEqiQqwrquWFzujzrE7i9lRPWGg1ULmuyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740427; c=relaxed/simple;
	bh=J1AaOi6iF4jXoNYZ8KIvyrM+zBKU6fKRBR51/vPoYtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jj9WS0HgwVm9udQ44PezMtGZdM+XlDXAqy4APWfd17/wpunTk8vyCD9ZD0e+WgVdhMDT9tNlUP0pKwSdU1ak2BsIXouo09dvJW567DCydY1cxDVoZIr2MB4J3ugDRz2F3oN6WdDs2tBi1nS8SnfJEcSq6wbdereBpifCnMtYBGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ur2uJfJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ur2uJfJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604E21F000E9;
	Wed, 22 Jul 2026 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784740421;
	bh=eLGH+onOHUQQ2Pa53WW6oK4W9UByI1udRdVtEs/DmAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ur2uJfJ+/90t5tzFCGojA0+rHOdWQadyPhYRnVTPlhMVUumGaIK/64ZGgH9F7ycns
	 7quzrvXKlQTeORK8q94fT7meGXH1rj3840W2LK8tthsD/Zrgv2HSiaxyPwBSjOQ3KE
	 iEQV+2E3j1QomkDN0pS5Yafp1+8YIZ+xwzgtYZ8+tslXjqstI+xhSviNwRGQM/U7ct
	 91jfhURy20NeqQN5u33AQcPYBJQqiO53Fy4XSWAYiGa3QJtOMHtplyK0zMcHSF973V
	 r1CyQ1YVb1UD9aVQRC8SZgqTSRRVdgrrhumhhQWROeK9a/BEULyfV0te/C5lH9Q7nH
	 SRufUZ+vohL6w==
Date: Wed, 22 Jul 2026 12:13:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: huang lin <hl@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: rockchip: Add RV1106
 compatible
Message-ID: <178474041814.1140906.9446539351605289459.robh@kernel.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
 <20260714132531.v2.2.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714132531.v2.2.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>


On Tue, 14 Jul 2026 13:25:30 -0600, Simon Glass wrote:
> Add the compatible for the pin controller of the Rockchip RV1106 and
> its RV1103 package variant.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

