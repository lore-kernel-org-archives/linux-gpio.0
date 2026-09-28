Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140037996B
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615751; cv=none; b=WU9yLko7RP3S/Wv8yJC7XiMohUKpLf7Inj3ZvPy+bX/w1GOb+az4QVoFoJF5anAt4lfN/PQueKYhMpoxCqLK4h/n1dG0UKR0PIi2i+sBTYOR2No2n5P25o0B6s7YqkH9N0Ik1VQxFnf7x8gZ/W1CnNNE9i2YNxCfMtAUxwfbJ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615751; c=relaxed/simple;
	bh=Q4Mh575eg9v5h38oPJgTx8zyEZnzz8QW4/N5Eo9TN0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVdfvLSGOHJu9M7pFm5uD83eIlbXLvIsU0TboATmGEiLtE0hbMwoOk2eyCXBCnV23+uS9bOPNh96nZ4+W8phQR/kX5effg4ZJH9V74I85Qa5CZ1kwHXxcnD7fejvliJXO2H8lbLUlZkdtkPqb/qTXMY7wGK8UW08S0MuGKynvmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ko+UlpLI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2nyXGl3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ko+UlpLI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2nyXGl3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEeJpR2298783
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 17:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1u3D+gLRaugKbtqoIYQkJDsvnpTdBDjmf5rMgadGeF4=; b=Ko+UlpLILdzM90mZ
	1c2FDEHYSDlFZEhxMAwwFYoMIz8n+zMh3rcOFr9uK+thKVXBDXwUWcK4g8JEkW+b
	S4/CXX1msBPXS9HoCQ6zyacpHO0tcIYJ8XsUhM0LpLivpPCIu+yOC/rYUVsnW7Xu
	3b65fGsw//0A1x4kTeFwsW2IzI5qSnTy9N8zIKSombTpkh/IyVpSOkZltfMTFTpU
	T11Q3Pjv44ETZXEpCmFDLcCfDry8mcbeoTDspu7PgFA2/bVeq5C/YHxRn6uolSfV
	qUuvWZde7wtuqnauQluVIDotSRTWTBUITdQX2Vdl2bxKOg8Y7oT2surIj1CdD+PH
	VnE0Ow==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6hx1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 17:15:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-791463ed29dso2911475137.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790615749; x=1791220549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1u3D+gLRaugKbtqoIYQkJDsvnpTdBDjmf5rMgadGeF4=;
        b=C2nyXGl31iZqtMAU4PcOk/EMYNbTfBd0E1KvgJ4L7Q60MgBSypjvgFENMBzzgUUifz
         88andtUxALXeFM0yj2K86cRrzlg4HpvBPcCWRSIwy8E3pswc9TMhTdTHOR8da+FErljz
         W5ezuYZrX7bPtoGzmrW0YMBUImQOkAs7aTWziU+tdSW278OAJ6Kya9i5QObUvLBnFdWi
         DZOzSmYUovHeYbT2FL/6xOJ1TOtL7bC1ahuCnjHqO55iiaqUEQhR8dxd+pNVpF/O5XWS
         pAMe5xQrhcSODayay0pl9rd5ckSMRj8ZjE4Y9vn46OBQ8+TNvDaqL4iQJT08ud7JHsO3
         uiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615749; x=1791220549;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u3D+gLRaugKbtqoIYQkJDsvnpTdBDjmf5rMgadGeF4=;
        b=I99MMU+eaWDG+G5R1hASplsHX6hhMHDB71YzGDxlmUkQw8EDDcu2UBOe9M8vhyyWLO
         Acq6YtjqT4HE9yJ0QY96oacyHOjrBqvspjhN/NWtYOFmb+qGO0273pZMphh7Wfp/UIlu
         h3BCqrVNfXlWrwINAswBy/Ig/oPV0kNoLM/wjzcW3qX1S6I1UsEEqstmA/XCT0M9a8ep
         EK1uobefQG7wWzGu8qW0EbsLdHnVMenu1qDMc3HrBxX2f09H82GKLzlVpUOOqhY4lNjR
         IoH6YTN1ApIyakZxd3L/ev7X0eD5/nAxU5oR8eOF26DYnYbSk9AnEepl7U1eKiQpWsd+
         HNhA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Zrk717LvOsactAH1pD+e6utozOtryJ0457twWzQGcxsAySU2rOCT5AcytREzz458bc3rYWOPcDcQ@vger.kernel.org
X-Gm-Message-State: AFq9FYIemS/6nbrR2ElcAaBYHe9Lmhtijh0fNqVEytVNnepLkrvWERot
	j91CisrQE2/Fi9dGOZgU5hGsQI+IO+CE70NTKpTDfjdboqlYFi4+8cKxYgR60ve9DTtgwQllGFM
	bye2dqe9qlANfzxUxHrOKD7mQGjl9sTf2McROrtsriYjiSRSRKQiSIecctjwTjgoo
X-Gm-Gg: AYBFou3uGlIeuEuc8VNkbKt1IUz6BnI7ifWf8uSbn88wcM9WY63rxLS5Hnzpb+NyUOv
	UKin9DKIn1kQjJj6E3cR1rbkU3HPOa3W0h2bDhhr4Se8J3I+1KC++sDuw//yUflydJxmz0VkmfO
	YVlP+RjYcGrq8ts0nu7FknIQJNhUiRfBYBPp3tzQegEgGNSpHosEVsStg+kid5dKhlA/ql+Oisy
	QABvO4TFvJyU64rzCdkIUkDT521TsWWExPPIMrybo7d0MFB1Yp6mtRbGJfsUg66lxPCc1DAW2Jp
	19AuoWzyYfNZ7EeUgi2B5al2LcRtN5de7/bswlAzL0kb3AqIRleusyk2hf+FJXBAAa1dJx2pwRL
	4o/eXTyd6dJfYDhfAbsADbRZb4Ctn82M=
X-Received: by 2002:a05:6102:6a85:b0:7b5:6bb2:538f with SMTP id ada2fe7eead31-7b56bc1b855mr1331246137.34.1790615746001;
        Mon, 28 Sep 2026 10:15:46 -0700 (PDT)
X-Received: by 2002:a05:6102:6a85:b0:7b5:6bb2:538f with SMTP id ada2fe7eead31-7b56bc1b855mr1331233137.34.1790615745623;
        Mon, 28 Sep 2026 10:15:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1e:67:47fe:5aa2:fd46:9d43:a18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea071sm5818675e9.9.2026.09.28.10.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:15:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] pinctrl: qcom: spmi-gpio: make direction changes exclusive
Date: Mon, 28 Sep 2026 19:15:40 +0200
Message-ID: <179061573784.16260.12006529556377696896.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927010913.1212600-1-shengchao.guo@oss.qualcomm.com>
References: <20260927010913.1212600-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OCBTYWx0ZWRfX2p95DaMVdwM+
 vPlLLU7BWV6lsdM2yF5s83lfiyAmHbiVxFMh0dbC++/i9LqE+SMGPz+K8f9hm2ky6rMXh/br3D8
 yXUua0W9MCgxl8HTy8KVPUa0vOKVFP+oLa+MlbIjg9CmnnFfxWR7lXryeKYgGd2qfkPOqsSIOEl
 ybaFLMLSO1RV9DptMK2vLJfWMuTYFpjPS4PtzzHxa2HuoXy5xhjJm1we5wtJOePPSaTI93GTUjn
 fW6pTHbyrkGzOOlTSVFfB0ld1K7Zbtq4/AdeUYCZ/T6a0m2lrA/ylIsqy3WGfhrP16GMDN93ou9
 weOEyHHWHQe6jGM5pITqQe0csecQd2ERR/GbbVFZO386uuNA/Dq4aHpdjS9URPopnLypbvT0pyX
 O5CKMUiXacuTPCsCxAKqH4WcfVbHQxRCZc5Ah59MyVmfpVA45eNUq3Omt9gplc7x7HrXd6MicSM
 QL7VHYUa9Nnl2gJ8JeQ==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6abaa0c5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=AuevRWDVcb3JQNfGZAwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OCBTYWx0ZWRfX+Wz1LeLEnXWq
 yvNwCZwfmwKw3nKYEFvgoFuCefChTcFfDz4ODEufotABB+km1NDi3vNYQSHvk4MYLMGhgRYluMP
 t9eFTsLS1zNTCe4iFFEzpSfloEPIvqE=
X-Proofpoint-ORIG-GUID: zPRXHXGlNAq5bz63mJyQ3-bRsZ0UrK6m
X-Proofpoint-GUID: zPRXHXGlNAq5bz63mJyQ3-bRsZ0UrK6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280068


On Sun, 27 Sep 2026 09:09:13 +0800, Shawn Guo wrote:
> Neither direction callback clears the opposite buffer: .direction_output()
> only packs PIN_CONFIG_LEVEL and .direction_input() only packs
> PIN_CONFIG_INPUT_ENABLE.  As pmic_gpio_populate() seeds input_enabled and
> output_enabled from MODE_CTL, a pad left in DIGITAL_INPUT[_OUTPUT] by the
> bootloader ends up in DIGITAL_INPUT_OUTPUT whichever direction is
> requested.  That leaves an input still driving the line, and makes
> pmic_gpio_get_direction() report an output as an input, which breaks
> consumers that read the direction back:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: spmi-gpio: make direction changes exclusive
      https://git.kernel.org/brgl/c/19fc4240358be2a25ce8e0a49a2819588ed61c5d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
