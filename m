Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444487;
	b=vNvwzvxrn3JonQFhJo0Lt0hld7p3oou3PSJfBQ8XAw5AS8AY+E/n0ZyLzkvdQjY8Di6e
	 YcPyQgb71r7kpxyHdjhyxzqrYuR/w8DbBjaDumGpLs3ljT/C2+/HTUWhkUKykiSCAC8uT
	 6UuCKevV7VmifBo1t5Ivpuu5Rxd19MVtu3q2dcpAIO3mP92bNXcfhNJJPHKeqPs0sUjnt
	 /up6Gi6zMa0EmEADzPwADap+8giqGCZxtrt+pDFgTO/5Zsa6hkxWf1C+W2WHJDuovZsXQ
	 yT+uhmR78tDl4Cc7i8vFX5k98PkQRJ3Zs2h/n5BNq/hoHSH8l9AMBZUXTEzvog5ieEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
	b=OXH6HVcALL5amb8mu+Ih3VEJqvIkhBnj45QKI/wqxWl7OOMuMhHz7kdZ8usTDrC6Hzma
	 v38hIJHJswGc/Gcj3E5i0Hp2dNCx2C0yLGNs2Y+SCRkDGg9Qgf4tUFIsrBZr4BXntOrR1
	 JCvPRVaJbcwZxgjqll78UQazKGY1yZf+UBtD2mxCuANeSubJpSG3oEysbUlwDttOy9/pd
	 sMWtvsheOARGhez6a21ljH3Q8KliK+zcADNGPBGBcfziKUfyRvgo6dal7cfAOA0afKIbs
	 bdvN5Ecrm/JPnoDmlUaesUv+JerLXhyRQ6N95DjhYx7+MmVZx2gCgUaihDdUGAb4SeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IBdhDM7/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C3j2/6nH";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E16606A321
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E16606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBdhDM7/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3j2/6nH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKvIi1974195
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=; b=IBdhDM7/3HUZSXDT
	STbqoNJPo9owgso9UilkDQ1JQnpWHbDOcojnxddccFlu8fewo4UUTQCb5yeoLf5C
	eYH36bKEhGSvqXQYmNFDn24gGNkWvr4thE9CrnjSerhEdQjMrmC2ifUyRaj3NAwd
	Fx4UYOo89OlRGkyXhhHw+KjlCUeTb5kBSl4Z4alesXJ5rZ2NCZi0fnniQWRth0TU
	K2PpHRW59IbpFVe4MTwXGnKxurv6P65/tYxVWmQ70jNRfoD0FCLxik6zxMFmRLEL
	0NAQ8FrB/kNcxbs05EPw43SMrL7u53rPzXF/UYaYJ+OE8o0qGS7ijxuuGB9EmKhD
	zYlOgg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ursbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 14:34:45 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4bfc0b441so44490707b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795444485; x=1796049285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
        b=C3j2/6nHdZtys2QUDXUO0TSbFjIwSOOANliTHWofJQRWUOcJ8zKb+SXYBZ1ieXjyTi
         0FoTs3QBKBtDS980V7RJIQ12r3l4HI25cHvVNdiFCr3FfjN9S0bqswUeK1RjPvmpp0oH
         aBMthSs2HYmswSyPDdYv0mf0A2i0xr78+cJvDBlyk3iw2GAcp904Kef4IOJmuOgoSXPC
         YJj5G27TmvzPwZ1CrPjz2qvZ/VTGjCMNGAukaaE9eOzZXIBvzZ108y68EpQLaZpJXukw
         BCY2W97hM28VCbBcSABWoU4CR/yOXLuyXz3vPAT8xY5TIGcXBhbnorRIxEIVHbqQC6Hl
         ralw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444485; x=1796049285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
        b=lgSbQ0m7s7iOv6+aVvTrTxbaNVsgSVJGTc1e1JglC+TYoaXT7Vo7ZSVUoe/6VkZPDy
         JE25OP2W3NndaNxrOpLg6b5Tmol2PrZFNYDpZpCzkNk1hshlNa9PtNLA6UlMVBy55w4v
         bIGPWR2SN2eIkAIzyE1ce9K3P60QCz21QjJ1t6jdL+01GMknwrnwsM0sk54Q/Xdc157A
         nej2/MalvCXXjxa0gVdkuWzq+SUxiVRb0sMR/q0QGYWclHxaU+2ASqmCt7MHNWBuUvge
         4SRDZQdqZWlB/qIwO12RjWGiLk6a5svlnU2VYG78jStTXj9yu8Kbf5dKdn93WYm1Kmyj
         h9DA==
X-Forwarded-Encrypted: i=1; AL+hErH+zK2HTHmGO1MiaDZxpCMZfB1XK+9R+I2KIEcrgxpSEfp3LIdBsLDxcDYi2qW6NddxMjfShFmk9dn1@vger.kernel.org
X-Gm-Message-State: APuU4Z9hfqq2osKITsBgfjw6d7irubOmaPMlnUFg+XzKp/8qk52VOaRi
	fkQfwYyjiIwzHT9zCpKWuftAnHxxars5M326bR3TAVkWzr69ZhWpswocweyyDtxGvmU89/BPucy
	IUg3pZz0G7aHrP3Way6n2x2jeUcfYIKKVbcj2vaE6H75iuo3Cnee3YFxm3qaSAix1
X-Gm-Gg: AZFdTZdmOtnuu9f3mReY3EfFJobJhjR8PWJPlJli2+jR5hLQTAjqFMj24ZfAd/MicFj
	CqwK5MoqVQGmPjirAebmaVXTzJUlrFngK2CNuIxFA3zzdxTVcpdBfi9Djmktu3+IRgsToTNY7OF
	C5y5b/VBIH82xAtfe9cjPrFN2SY6+Cbx57L10bkGiBQyscl/066x+8lWgGl0XKoxAUIJrkl71nr
	Zd5WVraApbD3Zcl4gLMGqaosahXU2KzVWBxj471Us4W3x5coiE2iiFngTmhoBlvV3cZJz3+W6U/
	QX3dH6hP/R/5CUeV6siqR82mdKRa/QXXUjUuLnDo/b2+30lZo6Pr3TgwKEpq1JdUzdObGOS5f47
	oKWPvFMLtlbNqrglVT5eLWSC0GcERTFCjDIyo7KbAKbURAhK+TkcgpucRNJcDLh94cxPYk6JmSH
	/GIGEWBHtODG7g2JA51a2TYhg9sAlV/qnihJCHyN72DHx7nzytLjHIpzMi8ZdI+A==
X-Received: by 2002:a05:690e:1c1c:b0:67c:1dca:7e0 with SMTP id 956f58d0204a3-67e03cff709mr2905905d50.14.1795444484831;
        Mon, 23 Nov 2026 06:34:44 -0800 (PST)
X-Received: by 2002:a05:690e:1c1c:b0:67c:1dca:7e0 with SMTP id 956f58d0204a3-67e03cff709mr2905869d50.14.1795444484149;
        Mon, 23 Nov 2026 06:34:44 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26263469f8f.21.2026.11.23.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:34:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH 00/18] pinctrl: qcom: add gp_mn mux function across Qualcomm TLMM blocks
Date: Mon, 23 Nov 2026 15:34:40 +0100
Message-ID: <179544447632.77146.14884722918215310109.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1JQVk63XPDjgO7wtH4DNgChbWt77BOE2
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b044f05 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gHIesgCGEubIfZZWx2YA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: 1JQVk63XPDjgO7wtH4DNgChbWt77BOE2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX8Xj8b9ktP1Lw
 ncYD4uNQirDnc5Y1GPVCfx6B7BzproNRQCvJlh7Vaay/mxps9q61RH8BoIY+zM1l1s3wY/2Cb2f
 Tn4Hb82uIO2uTZzdINU0Rcvh9a2gezE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX1NPhmBLxofOO
 Zvuu92C/VZUKIMfv8YXr376D8K7d4IRUZrEB0woesiCcxww074cO5/F9BlJ5hfoUmz/BJQvsDga
 oYXe33C+3Ew0zCMrB44sz8y1kBbBBW8S+QERl/jdCSGX7J+/3WH5PV6pKtoSVUu6sJXYiYh9QLS
 ejcgoWgoMdgnXs2QRIJIv5DUd6dsyOEwL+hjxh6Co2sP/sIbnYO2bzj72lHnDVWXPcNkdbPwdxY
 KPvOIdemjeXgxiPp/GsyC+Nxb2WlP7B6j9TJ1w+0AFLY5F/UE5ym8qQeZW9ITH3sffyTv1yKtcu
 hg9hXvBwM58ZaWRpZmI46TOHVki0Hdu3hLzPtwDQtGiSegFcS4h6rivv0OSuBOqrOrROzIOcBMS
 p1zwK0oGsoVzIj5fsIshMN2tmiGD2vs0wQb7jCmEoT9fXofFHmNnkDtmX+co37pwnm5hI9UQAkI
 whBGRR7xR10gEj7tK0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230057


On Wed, 18 Nov 2026 11:32:31 +0530, Taniya Das wrote:
> The GP M/N divider generates a clock output that can be routed to a TLMM
> pin via the gp_mn pinmux function. This series adds the gp_mn function to
> the Qualcomm TLMM pin control drivers that expose it.
> 
> The driver changes for QCS8300, SA8775P, SC7280 and QCS615 were originally
> part of the PDM GP_MN clock series, where only the drivers were posted.
> This series adds the matching gp_mn entry to each of those TLMM bindings as
> well, so the binding and driver stay self-consistent. The remaining patches
> extend the same gp_mn function to additional Qualcomm SoCs: SM8750,
> Kaanapali, Glymur, Shikra and Nord. For every SoC the gp_mn entry is added
> to its TLMM binding enum first, followed by the driver change.
> 
> [...]

Applied, thanks!

[01/18] dt-bindings: pinctrl: qcom: qcs8300: add gp_mn function
        https://git.kernel.org/brgl/c/98215755f97c9442690d7006390a6dd4fafe2496
[02/18] pinctrl: qcom: qcs8300: Add gp_mn mux function
        https://git.kernel.org/brgl/c/d44c2eca9f49c89e566368dc38aacb1cb0c2b1b8
[03/18] dt-bindings: pinctrl: qcom: sa8775p: add gp_mn function
        https://git.kernel.org/brgl/c/942cc68b11c1a99e0cd0722934135bc0585f2352
[04/18] pinctrl: qcom: sa8775p: Add gp_mn mux function
        https://git.kernel.org/brgl/c/04a448e013117a53f138464a3adc3454407e21cf
[05/18] dt-bindings: pinctrl: qcom: sc7280: add gp_mn function
        https://git.kernel.org/brgl/c/4b6560893c646794835fdd89643e9c71fd0ea870
[06/18] pinctrl: qcom: sc7280: Add gp_mn mux function
        https://git.kernel.org/brgl/c/dbb4b922fd5e5f6f3bb8b6ecf1d48aa73445f98c
[07/18] dt-bindings: pinctrl: qcom: qcs615: add gp_mn function
        https://git.kernel.org/brgl/c/0d3cf110ffdb691742c3659508d5023f15d509fb
[08/18] pinctrl: qcom: qcs615: Add gp_mn mux function
        https://git.kernel.org/brgl/c/5308e218e3c2cbf9cfafce322b3bdfbd71b258da
[09/18] dt-bindings: pinctrl: qcom: sm8750: add gp_mn function
        https://git.kernel.org/brgl/c/0cb5ffa9eb0ce97db86106d298d2b39d55680c81
[10/18] pinctrl: qcom: sm8750: Add gp_mn mux function
        https://git.kernel.org/brgl/c/c24a092390a21ecb61ec8171b41fa289d27418e9
[11/18] dt-bindings: pinctrl: qcom: kaanapali: add gp_mn function
        https://git.kernel.org/brgl/c/d804723bcfda3f2b30618aec18eb1cc0881ea13b
[12/18] pinctrl: qcom: kaanapali: Add gp_mn mux function
        https://git.kernel.org/brgl/c/dd9ecba27b981279e2cc84a225a11c7c6308ea76
[13/18] dt-bindings: pinctrl: qcom: glymur: add gp_mn function
        https://git.kernel.org/brgl/c/844b5b901910df4718171519fb1393e2bea57bac
[14/18] pinctrl: qcom: glymur: Add gp_mn mux function
        https://git.kernel.org/brgl/c/b1922656379ea475bfc5c0f21f615c4eddcd0226
[15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn function
        https://git.kernel.org/brgl/c/36303ea598135dfbe30c77773af509ba32542795
[16/18] pinctrl: qcom: shikra: Add gp_mn mux function
        https://git.kernel.org/brgl/c/c16f39dad1bbb9dc10886de1b113695166d60bb9
[17/18] dt-bindings: pinctrl: qcom: nord: add gp_mn function
        https://git.kernel.org/brgl/c/0a9a2a463910ba341fc12adf362227f730de7aff
[18/18] pinctrl: qcom: nord: Add gp_mn mux function
        https://git.kernel.org/brgl/c/e19e48b2e6c603ebd4839153a45294a9c416e083

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
