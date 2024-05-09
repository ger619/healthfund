import react, {useState} from "react";
import { createDoctor } from "@/utils";

const  Form = () => {
    const [useDoctor, setDoctor] = useState("");

    // Creating a doctor form logins and details

    return (
        <div className="flex flex-col justify-center items-center">
            <div className="h1">
                This is the form
            </div>
            <div>No Wallet Connected</div>
            <form>
                <label>
                    Name:
                    <input type="text" name="name" />
                </label>
                <input type="submit" value="Submit" />
            </form>
        </div>
    );
}

export default Form;