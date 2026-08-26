Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC334753B
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751373; cv=none; b=Tm5SfVWpNr5rdngqT+YUN59q9PtXFr8aFyiudIYJm+CFFxxEWp2tuQ08rS1OxRlZ0g7VhS/gs4phFjEgdJ4L8HiyiwbocQeLIKn3TGDthU8efKVKvURhYgAnjH4qsMnXcTKEe4TtnDYuZG+i7zpyut6PqcPQ2YbjJ7hXtFHIKiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751373; c=relaxed/simple;
	bh=QmocaZI6v8/HE3l87P6BrE5F5pxhD/tOiaWeLGuWBWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7i2vlycyouxv/pyBbhWwBK9GzmjmTb5hyO6Ry0qCeakLjEbCvoMwKea1lUnXEKdjfREteIxM8YnbZaAwzoOsTQbScjCwb4xYf1Aygc/gK9QvwgE6XYLnb1VnGYZ2GF70A/MV7h4lHkjxaiEcmNXvWSgA/PemNUH4Q/5g/WbJxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TC3kMFvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5IB4Obc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TC3kMFvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5IB4Obc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCIbo882134
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 13:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtbNasJFgGUrBr6ZNQv/nV3AmOlHHVHM0xaDt+EtLes=; b=TC3kMFvQwcR1KUar
	tBf53nSU5HufBqyhq9/iAZeP3xH1LWaMCxGFkIToqNPQ+OfGIGjuTDAmE+acvd0L
	EXMdcpF/Fl+nOFSexpLY8+NlZucIyURHx/N7RJgKPVeoZ66CKtSGjn+INfEFr3DM
	eNS2zNR8pN/D3plCXPJHlVzExvo+yh88hn8ygPgbae8pXss5zhj89pA2GJSF6+bo
	aKdfgqSbSkeL9aAKYyNpQ3wVpqgPrU1oGq55KAZ/PmXVS90tiCmydoBF1w1z11tK
	84XX7YfWDWr272pXrHDa502jSPj8HJMw6NtAQTPDJ36GLPOxYYo9RTq37Pfe04h7
	hFfixw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k2bvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 13:36:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cd2cadc62so954566d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751369; x=1788356169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VtbNasJFgGUrBr6ZNQv/nV3AmOlHHVHM0xaDt+EtLes=;
        b=W5IB4Obc+9i7RISxM10nwAAGCMETmRofbUAxz3PVR8R8SfjSEHq6l3diOuD+RBTKgn
         FBFljWO+alyWx1G4LAOOtJUNKk5wTbi715JZTNlF4UF4ybBFvy1S2+eDx7fICNh+dOzY
         jH31JLb4C0cRIVtCWjgdm3hhKfCwQupZacqCvE3MwwzfafTSWpNm8uHgNikbPlVqzVNy
         1M6YUscwN7heNFy9SqfD3ZbJQsGa+pjCz0ZzVSd5TNzItfHwmhMJFgNY3QCdtJzofKCU
         PxtPHuC5UEGInxNjtvNsmZNoJo2X/2RH9fJTjaEdOp2+ZIGRKSXKwtdW71CFoBKgP4D1
         BZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751369; x=1788356169;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtbNasJFgGUrBr6ZNQv/nV3AmOlHHVHM0xaDt+EtLes=;
        b=IwRvCAgz+xT7AV4yNUP17dOJDc/UgAuR4hQnBzLLmwj+l1DXJp7DPJ+8djkFe4E0Ti
         OMLdIaut+rhVi3UMD/IYZuAK1NRnu4C8Pm324jjajGvuOqnayDcLH8yCWreIaXLewZd3
         MBUphTT47pc6vrsIzx9oCWs3d7VFsAkzFZwA5KIImw8Rnwcip7AE+Qn5TpJlklocka5W
         Krf971ISlZpbxcD1DJ/aZcg9xN4B/sKvob3XJtbzZA2WFB0KwmdB4iySjsUj0Utxem0t
         mgHqVdrAcBabJCiognlEX5VNvNNMqQHbin65y+btJmO+OyK0l5oFIvFq9sMgWZcwws0B
         vpWg==
X-Forwarded-Encrypted: i=1; AHgh+Rrq9yMhHY/YHJnaFmJ9aC0fCHnzoTGVYKspP9Zz4mLHdtXaSW7m6mEWwvJ/PTNZ1ST0g3oEuyOoZGZy@vger.kernel.org
X-Gm-Message-State: AFuF++nprRCHluYiSkxNtG4tsdgvYWVC1pq5PFgPSiHHB8pfNBJ4IbMC
	A49hfwEooHomW4wxlIfscL1/HbVfx6hnt0wJzY8o/40xqSy7q19FfO53JnfYSp2FTLCk82J+Nzm
	Oa3aJvpxJch0Kda3ZejrK1YaIULQ828L0uhQYXUalwWgrX6opG3nfKJLm9dAnJspu
X-Gm-Gg: AR+sD12hJ3HnP0zr5zSpPWJDJhWaZ+qRzqd2Rsfj37IRTYD9bcV9yE2vrpF33atL9T6
	b0AtHZTgMYZrzl15gC0WLft5Ns+rhEQqeja3yBCSXJ+pvenZuWXWgqmceSLYM1HEXH75cd9oXvj
	78PO9b3tUWFgjMkdSBXMhTwcxIbxUNZy51e4NJuGhtyYUi2Tqpf5tQJBRFZk4PeeU48V3M6H6Gp
	54LJGCSEnIYnyj9mnnJnoxj+pF6j3jiA4jWzwvg83fe6lgmDqdfBjcj9D8vdQsl4CMf6yyvxhsm
	lz4InQ2c7yDdCtuQ7jGnjUKGvee9I64S52lKJFYuk9P58R5gDTqrKEULKklqZc5I6uMCrec7mz5
	gTzAfjgcoO90vllN5ro0PaDpkjlXe
X-Received: by 2002:ac8:7e8d:0:b0:52d:918b:92e2 with SMTP id d75a77b69052e-52e4222c9c4mr65526551cf.6.1787751369478;
        Wed, 26 Aug 2026 06:36:09 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:52d:918b:92e2 with SMTP id d75a77b69052e-52e4222c9c4mr65525671cf.6.1787751368956;
        Wed, 26 Aug 2026 06:36:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deac6848sm4241597a12.24.2026.08.26.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:36:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Vincent Jardin <vjardin@free.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes
Date: Wed, 26 Aug 2026 15:36:03 +0200
Message-ID: <178775135167.59974.3175539480140201865.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825-for-upstream-dt-qoriq-gpio-hog-v3-1-b99bda4f44d7@free.fr>
References: <20260825-for-upstream-dt-qoriq-gpio-hog-v3-1-b99bda4f44d7@free.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8eebca cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VIjY3HyipIfhJr2Qx8cA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX3/HZCbbO6zKb
 4MNsuwV7IADd6hdbwo+JTyj9wMgQ6xuVBiL/GuPZn4qyxVJa4ui9Gf77gNWAbtzAYfF3aITZfHy
 l2Cdq+C6Zxc2OEkbzGrtOoaW0J1mM1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX/x+mZH+qrjHy
 vqy9ly6sZGJlb0+19ewwqImj63Mfna7zrKGNmv0z5Cs8NpagASF3eDK0gNJiVs6USEEee01NB4B
 QFLFqtB2MDzx06jLl6xC6JEuXOoO8wa5j4guR0cqJ5IE2XLEvpJk8Z2Ku8e/D+03910rPtZ7lNp
 CiwFBmSF+OAx4KEiw/pEfRaaVKeNydbN4mU3QGco9wKwODpg9dz5E1Q2THHxnToKxzRR579Q2Mc
 m6HqIkVHMvAkEY40OygI/VAuuvJCEiyJ4Cc3l9fYf/m6d8mwxAMTpK/bSMzeV0RyFFFQsjGHG3S
 1IsvM3Ua1WXQdJ4a/bow7K74SMQVUMIqofF3hG08/hVdlr1FGxtGjyiRrDsLdulTil6qkDm/Ucr
 Fu7u/d10UWDGaXg4UKeOVuGc4nmQAD03h5xhOBtBDHGLbySW1+h5MVfEaFD4+JRtsRixQCIGTdo
 nFcaRMw1Sxk6uQoPH0A==
X-Proofpoint-ORIG-GUID: sbh5fTYn6uZpilR2ZKBfrRMsRHZU5rIT
X-Proofpoint-GUID: sbh5fTYn6uZpilR2ZKBfrRMsRHZU5rIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260112


On Tue, 25 Aug 2026 11:41:57 +0200, Vincent Jardin wrote:
> QorIQ GPIO controllers may have hogs in device nodes, so let's expose
> it.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes
      https://git.kernel.org/brgl/c/78c0baf85cd0ab61939b6d4670158d5c53dada69

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
