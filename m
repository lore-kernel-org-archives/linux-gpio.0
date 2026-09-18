Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5435208B7;
	Fri, 18 Sep 2026 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756786; cv=none; b=GB7N5Jq2CVyVljFE2B5zO1sc8o06f/7LcCiRTAcdjeJjXMqENlw11/GUc/LFx+owZHjVMSimq2R1hrDZ+Vaqn0zRJS8D8lhCD4KgkiD1OffxAjgZ90quypbtQSD1LEdluZ8pXiw1vOnRriTr8clxX4FRhE2c7/cK/FhPkuNlzA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756786; c=relaxed/simple;
	bh=/UzHpLBPo/zmn3SMt4urI7L6gu5W4B7E4aHtmThSOCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdZWHhhxE5VBvcKYUhSWM5IgTzv6cqlEin4TJ71/D8OOOkfLHAhtMgU3WwNuv7JZP7u5ulR+A1tCVW0twj+DJkdaFTyKkemBfVMEvr/LSU9wMrZfixs7z8+QjUjSZqwzoafIWeCAnC/GyLtWlWiMQZPdaqEFpUVdR+/PMZuB4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eo7QJoRq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eo7QJoRq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAC01F00898;
	Fri, 18 Sep 2026 18:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756775;
	bh=xTQETUzTDt6e+MU4I+eP6rVfZVdsGsIww6yfCzUatU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eo7QJoRq2YI9PHxFEbM4CrTtiV0ZWT/EDzfBk/v0St46Pcp4miQxRZ5Tl0jEPOcrT
	 0jyxNfynvSwpqJKhi8cfMiElglT/ALBxne2HBbmIYkjZ1AklKCvugXWsjIP31V088g
	 GDgFLbFSZoMz9+PQVkpB2sE9c79pgTT1Hmo3Q1iZxojN4zL8J76jVZ0lYyMP/E86Ks
	 ifg6lLftK4qXFqILfOAxEfnZXaw6OUdidTsTCxzXtuV9KMYbM+u92knVizMhoiXRMi
	 UlkIUytGEd3qbp+Clu3aPvpKjVlNELm2YvLTfXCzpGK5XvuYSfG2Gw7wN13A0QQNET
	 lGzbwpBdQNkzg==
Date: Fri, 18 Sep 2026 13:39:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v8 13/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Message-ID: <178975664744.1339867.1072081982014838266.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-14-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-14-changhuang.liang@starfivetech.com>


On Thu, 10 Sep 2026 03:03:48 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

