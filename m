Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B783B3BFE
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328635; cv=none; b=L7OPSuUiiiNyHpVcqCzeLw0o7AQrjt6JHh/fBSBqDp75zA/G7oQL4JfN4x5ZftTcXxmWbqoSsnhs6KufBTg0L2iEqkBzXyzdsC/SRPIFzU8udXAWnvXAO7E/EFDd6UmPf6xUONvayeAkrcjKzE2AK/PDjq5fqFPT8OTjitqLXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328635; c=relaxed/simple;
	bh=2D34RYxVtpQLJYURr06irwa2SoBgHUUijQRKQS57PE4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pmSbnRy3Mtn86kbhG7iKGxMu/9dgeLUcF1TjwBgwGGcIDblBXw9alrjtAkbsH9faL3xrLx4/+u95y/Pxc74SD+c0iaJDcWwNF9LebAYIlmJ1/1X23tnikpFdkebHp8BxcZM4yufhB3AddW/W8XMAkrweveYMXXLC1o48qrMCirs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WIuz54pu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WIuz54pu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97C4BC8EC67;
	Mon,  6 Jul 2026 09:03:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6142F601A2;
	Mon,  6 Jul 2026 09:03:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91CB311BB9D70;
	Mon,  6 Jul 2026 11:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783328624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EzXpYPV0PFB6TX9ZDcqY7ctXsxYzZyik5uIt1kgj5dk=;
	b=WIuz54puOIXvKsy0eg8hrSFIjyHK/usc7xVOrM0SNdZJgw12G3lKlHqewYnbWQemzWZMkt
	/II90sH6P0vbNirv6FCXYhRej6fzQU8Fc/UkcuengFjODFKvrQQZxobS8ssaQuzaKQ4zXa
	JMxB0yGF8nyVXi5OBQS4EZUXkUIcuMfrMp08oeRMPF73D4WLEo+HBEinnD+Gq4Qf2szNi+
	kR3dCEPtfXTAeXiuUh7UmXx99vauQZkyFHOgz0Qzo0vbNt0z3K3W7885eviRaI2SRAp9y0
	uRX5EZxDHaOWHj5kh80o0rtJCECCug1X7xc239ItstJdjNdLjPkp+u0i2wOVQw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 11:03:40 +0200
Message-Id: <DJRD8IJUMKXJ.20CSZPRGGL3KE@bootlin.com>
Cc: "Qiang Zhao" <qiang.zhao@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 03/12] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-3-6c3e706e27dc@bootlin.com>
 <20260706-piquant-arboreal-panda-b810f2@quoll>
In-Reply-To: <20260706-piquant-arboreal-panda-b810f2@quoll>
X-Last-TLS-Session-Version: TLSv1.3

Hi Krzysztof,

On Mon Jul 6, 2026 at 8:48 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 03:30:11PM +0200, Paul Louvel wrote:
>> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario=
-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-ba=
nk.yaml
>> new file mode 100644
>> index 000000000000..1af99339ff40
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.y=
aml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpio/fsl,mpc8323-qe-pario-bank.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale QUICC Engine Parallel I/O (QE PARIO) GPIO Bank
>> +
>> +maintainers:
>> +  - Christophe Leroy <christophe.leroy@csgroup.eu>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - fsl,mpc8360-qe-pario-bank
>> +              - fsl,mpc8569-qe-pario-bank
>
> None of these were in the old binding. You need to mention and
> explain (WHY) the changes you are doing to the binding during the
> conversion.

Ok.

>
>> +          - const: fsl,mpc8323-qe-pario-bank
>> +      - const: fsl,mpc8323-qe-pario-bank
>
> Best regards,
> Krzysztof

Thanks,
Paul.


--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

