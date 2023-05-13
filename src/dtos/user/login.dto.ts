import z from "zod";

export interface LoginInputDTO {
  nickname: string;
  password: string;
}

export interface LoginOutputDTO {
  token: string;
}

export const LoginSchema = z
  .object({
    nickname: z
      .string({
        required_error: "'nickname' é obrigatório",
        invalid_type_error: "'nickname' deve ser do tipo string"})
      .regex(
        /^[a-zA-Z]{5,}$/,
        "'nickname' deve ter pelo menos 5 caracteres, sem espaços e sem caracteres especiais."
      ), 
    password: z
      .string({
        required_error: "'password' é obrigatório",
        invalid_type_error: "'password' deve ser do tipo string",
      })
      .regex(
        /^(?=.*[A-Za-z]{5})(?=.*\d{2}).{7,}$/,
        "'password' deve ter pelo menos 7 caracteres, incluindo pelo menos 2 números e 5 letras."
      ),
  })
  .transform((data) => data as LoginInputDTO);
